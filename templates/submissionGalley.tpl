{**
 * plugins/generic/videoJsViewer/templates/watchVideo.tpl
 *
 * Embedded viewing of a video galley.
 *}

<!-- Captura el título de la página traducido -->
{capture assign=pageTitle}{translate key="plugins.generic.videoJsViewer.watchVideo"}{/capture}
<!-- Asigna el título de la página traducido a la variable "pageTitle" -->

<!-- Incluye el archivo de plantilla del encabezado -->
{include file="frontend/components/header.tpl"}

<!-- Contenedor principal centrado con un margen superior -->
<div class="container" style="text-align: center; margin-top: 30px;">
    <!-- Título del galley del video -->
    <h2>{$galleyFile->getLabel()}</h2>
    <!-- Contenedor del video con un ancho máximo del 100% y un ancho del 80% del contenedor padre -->
    <div style="display: inline-block; max-width: 100%; width: 80%;">
        <!-- Reproductor de video usando Video.js -->
        <video id="video-js" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="auto" width="100%" height="auto" data-setup="{}">
            <!-- Fuente del video, obtenida de la URL de descarga del galley -->
            <source src="{url page="article" op="download" path=$galleyFile->getBestGalleyId()}" type="video/mp4">
            <!-- Mensaje mostrado si el navegador no soporta JavaScript -->
            <p class="vjs-no-js">
                {translate key="plugins.generic.videoJsViewer.noJsMessage"}
            </p>
        </video>
    </div>
</div>

<!-- Enlaces a los recursos de Video.js (hojas de estilo y scripts) -->
<link href="https://vjs.zencdn.net/7.10.2/video-js.css" rel="stylesheet" />
<script src="https://vjs.zencdn.net/7.10.2/video.js"></script>

<!-- Incluye el archivo de plantilla del pie de página -->
{include file="frontend/components/footer.tpl"}

