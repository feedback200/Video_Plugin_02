<?php

// Importa la clase base para plugins genéricos de PKP
import('lib.pkp.classes.plugins.GenericPlugin');

// Define la clase del plugin VideoJsViewer que extiende de GenericPlugin
class VideoJsViewerPlugin extends GenericPlugin {

    /**
     * Registra el plugin en una categoría específica
     * 
     * @param string $category La categoría en la que se registra el plugin
     * @param string $path La ruta del plugin
     * @param int|null $mainContextId El ID del contexto principal (opcional)
     * @return bool true si se registra exitosamente, false en caso contrario
     */
    function register($category, $path, $mainContextId = null) {
        // Llama al método register de la clase base
        if (parent::register($category, $path, $mainContextId)) {
            // Verifica si el plugin está habilitado
            if ($this->getEnabled($mainContextId)) {
                // Para OPS: registra el gancho para la visualización de galeradas de preprints
                HookRegistry::register('PreprintHandler::view::galley', [$this, 'submissionCallback'], HOOK_SEQUENCE_LAST);
                // Para OJS: registra el gancho para la visualización de galeradas de artículos
                HookRegistry::register('ArticleHandler::view::galley', [$this, 'submissionCallback'], HOOK_SEQUENCE_LAST);
                // Para OJS: registra el gancho para la visualización de galeradas de números
                HookRegistry::register('IssueHandler::view::galley', [$this, 'issueCallback'], HOOK_SEQUENCE_LAST);
                // Requiere componentes locales comunes de la aplicación
                AppLocale::requireComponents(LOCALE_COMPONENT_APP_COMMON);
            }
            return true;
        }
        return false;
    }

    /**
     * Obtiene el nombre para mostrar del plugin
     * 
     * @return string El nombre para mostrar del plugin
     */
    function getDisplayName() {
        return __('plugins.generic.videoJsViewer.name');
    }

    /**
     * Obtiene la descripción del plugin
     * 
     * @return string La descripción del plugin
     */
    function getDescription() {
        return __('plugins.generic.videoJsViewer.description');
    }

    /**
     * Callback para la visualización de preprints/artículos
     * 
     * @param string $hookName El nombre del gancho (hook)
     * @param array $args Los argumentos pasados al gancho
     * @return bool true si se procesa exitosamente, false en caso contrario
     */
    function submissionCallback($hookName, $args) {
        // Obtiene los argumentos de la llamada al gancho
        $request = $args[0];
        $issue = $args[1];
        $galley = $args[2];
        $submission = $args[3];
        $submissionFile = $galley->getFile();
        $author = $submission->getCurrentPublication()->getData('authors')[0];
    
        // Verifica si el archivo es un video MP4
        if ($submissionFile->getData('mimetype') === 'video/mp4') {
            // Obtiene el gestor de plantillas
            $templateMgr = TemplateManager::getManager($request);
            // Asigna variables a la plantilla
            $templateMgr->assign(array(
                'displayTemplateResource' => $this->getTemplateResource('display.tpl'),
                'pluginUrl' => $request->getBaseUrl() . '/' . $this->getPluginPath(),
                'galleyFile' => $submissionFile,
                'issue' => $issue,
                'submission' => $submission,
                'author' => $author,
                'galleyTitle' => $galley->getLabel(),
                'videoUrl' => $request->url(null, 'article', 'download', [$submission->getBestId(), $galley->getBestGalleyId()]),
                'datePublished' => $submission->getCurrentPublication()->getData('datePublished'),
                'page_title' => $submission->getLocalizedTitle(), // Asumiendo que el título del artículo es adecuado para page_title
            ));
            // Muestra la plantilla
            $templateMgr->display($this->getTemplateResource('display.tpl'));
            return true;
        }
    
        return false;
    }
    
    /**
     * Callback para la visualización de números
     * 
     * @param string $hookName El nombre del gancho (hook)
     * @param array $params Los parámetros pasados al gancho
     * @return bool true si se procesa exitosamente, false en caso contrario
     */
    function issueCallback($hookName, $params) {
        // Obtiene los parámetros de la llamada al gancho
        $request = $params[0];
        $issue = $params[1];
        $galley = $params[2];

        // Verifica si el archivo es un video MP4
        if ($galley->getFileType() == 'video/mp4') {
            // Obtiene el gestor de plantillas
            $templateMgr = TemplateManager::getManager($request);
            // Asigna variables a la plantilla
            $templateMgr->assign(array(
                'displayTemplateResource' => $this->getTemplateResource('display.tpl'),
                'pluginUrl' => $request->getBaseUrl() . '/' . $this->getPluginPath(),
                'galleyFile' => $galley->getFile(),
                'issue' => $issue,
                'galley' => $galley,
                'videoUrl' => $request->url(null, 'issue', 'download', [$issue->getBestIssueId(), $galley->getBestGalleyId()]),
                'datePublished' => $issue->getData('datePublished'),
            ));
            // Muestra la plantilla
            $templateMgr->display($this->getTemplateResource('display.tpl'));
            return true;
        }

        return false;
    }
}
?>
