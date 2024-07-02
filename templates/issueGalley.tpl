{**
 * plugins/generic/videoJsViewer/templates/issueGalley.tpl
 *
 * Embedded viewing of a video galley.
 *}

<!-- Captura la URL para descargar el video galley -->
{capture assign="videoUrl"}{url op="download" path=$issue->getBestIssueId($currentJournal)|to_array:$galley->getBestGalleyId($currentJournal) escape=false}{/capture}
<!-- Asigna la URL de descarga del video galley a la variable "videoUrl" -->

<!-- Captura la URL del padre, que es la vista de la edición -->
{capture assign="parentUrl"}{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}{/capture}
<!-- Asigna la URL de la vista de la edición a la variable "parentUrl" -->

<!-- Captura el título del galley -->
{capture assign="galleyTitle"}{translate key="submission.representationOfTitle" representation=$galley->getLabel() title=$issue->getIssueIdentification()|escape}{/capture}
<!-- Asigna el título del galley a la variable "galleyTitle" -->

<!-- Captura la fecha de publicación formateada -->
{capture assign="datePublished"}{translate key="submission.outdatedVersion" datePublished=$issue->getData('datePublished')|date_format:$dateFormatLong urlRecentVersion=$parentUrl}{/capture}
<!-- Asigna la fecha de publicación formateada a la variable "datePublished" -->

<!-- Incluye el archivo de plantilla especificado para mostrar el video -->
{include file=$displayTemplateResource title=$issue->getIssueIdentification() parentUrl=$parentUrl videoUrl=$videoUrl galleyTitle=$galleyTitle datePublished=$datePublished}
<!-- Incluye la plantilla de visualización utilizando las variables capturadas -->
