{**
 * plugins/generic/videoJsViewer/templates/watchVideo.tpl
 *
 * Embedded viewing of a video galley.
 *}

<!-- Capture the translated page title -->
{capture assign=pageTitle}{translate key="plugins.generic.videoJsViewer.watchVideo"}{/capture}
<!-- Assign the translated page title to the "pageTitle" variable -->

<!-- Include the header template file -->
{include file="frontend/components/header.tpl"}

<!-- Main container centered with top margin -->
<div class="container" style="text-align: center; margin-top: 30px;">
    <!-- Video galley title -->
    <h2>{$galleyFile->getLabel()}</h2>
    <!-- Video container with a maximum width of 100% and a width of 80% of the parent container -->
    <div style="display: inline-block; max-width: 100%; width: 80%;">
        <!-- Video player using Video.js -->
        <video id="video-js" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="auto" width="100%" height="auto" data-setup="{}">
            <!-- Video source, obtained from the galley download URL -->
            <source src="{url page="article" op="download" path=$galleyFile->getBestGalleyId()}" type="video/mp4">
            <!-- Message displayed if the browser does not support JavaScript -->
            <p class="vjs-no-js">
                {translate key="plugins.generic.videoJsViewer.noJsMessage"}
            </p>
        </video>
    </div>
</div>

<!-- Links to Video.js resources (stylesheets and scripts) -->
<link href="https://vjs.zencdn.net/7.10.2/video-js.css" rel="stylesheet" />
<script src="https://vjs.zencdn.net/7.10.2/video.js"></script>

<!-- Include the footer template file -->
{include file="frontend/components/footer.tpl"}
