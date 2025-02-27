{**
 * plugins/generic/videoJsViewer/templates/display.tpl
 *
 * Embedded viewing of a video galley.
 *}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<head>
    <!-- Meta tags for encoding and viewport settings -->
    <meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$title|escape}</title>

    <!-- Loading headers, stylesheets, and scripts specific to the frontend context -->
    {load_header context="frontend" headers=$headers}
    {load_stylesheet context="frontend" stylesheets=$stylesheets}
    {load_script context="frontend" scripts=$scripts}

    <!-- Loading Video.js styles and scripts for video playback -->
    <link href="https://vjs.zencdn.net/7.10.2/video-js.css" rel="stylesheet" />
    <script src="https://vjs.zencdn.net/7.10.2/video.js"></script>

    <!-- Custom styles for the page -->
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }
        .header_view {
            text-align: center;
            margin-bottom: 20px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .header_view a {
            text-decoration: none;
            color: #007BFF;
        }
        .header_view a.return {
            float: left;
        }
        .header_view a.download {
            float: right;
        }
        .header_view h1 {
            margin: 0;
            font-size: 24px;
        }
        .content {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .content h2, .content h3, .content p {
            margin: 0 0 10px;
        }
        .content h2 {
            font-size: 20px;
            color: #555;
        }
        .content h3 {
            font-size: 18px;
            color: #777;
        }
        .content p {
            font-size: 16px;
            color: #666;
        }
        .video-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .video-js {
            width: 100%;
            max-width: 800px;
        }
        .vjs-big-play-button {
            margin-left: 42%;
            margin-top: 18%;
        }
    </style>
</head>
<body class="pkp_page_{$requestedPage|escape} pkp_op_{$requestedOp|escape}">

    <!-- Header of the view -->
    <header class="header_view">
        <!-- Link to go back to the previous page -->
        <a href="javascript:history.go(-1);" class="return">
            <span class="pkp_screen_reader">
                {if $parent instanceOf Issue}
                    {translate key="issue.return"}
                {else}
                    {translate key="article.return"}
                {/if}
            </span>
        </a>
        <!-- Link to download the video -->
        <a href="{$videoUrl}" class="download" download>
            <span class="label">
                {translate key="common.download"}
            </span>
            <span class="pkp_screen_reader">
                {translate key="common.downloadVideo"}
            </span>
        </a>
        <!-- Page title -->
        <h1>{$title|escape}</h1>
    </header>
    <!-- Additional space -->
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <!-- Video container -->
    <div id="videoCanvasContainer" class="galley_view{if !$isLatestPublication} galley_view_with_notice{/if}">
        <div class="video-container">
            <!-- Video player using Video.js -->
            <video id="video-js" class="video-js vjs-default-skin" controls preload="auto" title="{$galleyTitle}" data-setup="{}">
                <source src="{$videoUrl}" type="video/mp4">
                <p class="vjs-no-js">
                    {translate key="plugins.generic.videoJsViewer.noJsMessage"}
                </p>
            </video>
        </div>
    </div>
    <!-- Additional space -->
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <!-- Additional content -->
    <div class="content">
        <h1>{$page_title|escape}</h1>
        <h3>{translate key="author.name"}: {$author->getFullName()}</h3>
        <p><strong>{translate key="article.abstract"}:</strong> {$submission->getLocalizedAbstract()}</p>
        <p><strong>{translate key="article.publicationDate"}:</strong> {$datePublished|date_format:"%B %e, %Y"}</p>
    </div>
</body>
</html>
