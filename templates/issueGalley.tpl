{**
 * plugins/generic/videoJsViewer/templates/issueGalley.tpl
 *
 * Embedded viewing of a video galley.
 *}

<!-- Capture the URL to download the video galley -->
{capture assign="videoUrl"}{url op="download" path=$issue->getBestIssueId($currentJournal)|to_array:$galley->getBestGalleyId($currentJournal) escape=false}{/capture}
<!-- Assign the video galley download URL to the "videoUrl" variable -->

<!-- Capture the URL of the parent, which is the issue view -->
{capture assign="parentUrl"}{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}{/capture}
<!-- Assign the issue view URL to the "parentUrl" variable -->

<!-- Capture the galley title -->
{capture assign="galleyTitle"}{translate key="submission.representationOfTitle" representation=$galley->getLabel() title=$issue->getIssueIdentification()|escape}{/capture}
<!-- Assign the galley title to the "galleyTitle" variable -->

<!-- Capture the formatted publication date -->
{capture assign="datePublished"}{translate key="submission.outdatedVersion" datePublished=$issue->getData('datePublished')|date_format:$dateFormatLong urlRecentVersion=$parentUrl}{/capture}
<!-- Assign the formatted publication date to the "datePublished" variable -->

<!-- Include the specified template file to display the video -->
{include file=$displayTemplateResource title=$issue->getIssueIdentification() parentUrl=$parentUrl videoUrl=$videoUrl galleyTitle=$galleyTitle datePublished=$datePublished}
<!-- Include the display template using the captured variables -->
