{**
 * plugins/generic/videoJsViewer/templates/display.tpl
 *
 * Embedded viewing of a video galley.
 *}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<head>
    <!-- Meta etiquetas para la codificación y la configuración de la vista -->
    <meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$title|escape}</title>

    <!-- Carga de cabeceras, hojas de estilo y scripts específicos del contexto frontend -->
    {load_header context="frontend" headers=$headers}
    {load_stylesheet context="frontend" stylesheets=$stylesheets}
    {load_script context="frontend" scripts=$scripts}

    <!-- Carga de estilos y scripts de Video.js para la reproducción de videos -->
    <link href="https://vjs.zencdn.net/7.10.2/video-js.css" rel="stylesheet" />
    <script src="https://vjs.zencdn.net/7.10.2/video.js"></script>

    <!-- Estilos personalizados para la página -->
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

    <!-- Cabecera de la vista -->
    <header class="header_view">
        <!-- Enlace para volver a la página anterior -->
        <a href="javascript:history.go(-1);" class="return">
            <span class="pkp_screen_reader">
                {if $parent instanceOf Issue}
                    {translate key="issue.return"}
                {else}
                    {translate key="article.return"}
                {/if}
            </span>
        </a>
        <!-- Enlace para descargar el video -->
        <a href="{$videoUrl}" class="download" download>
            <span class="label">
                {translate key="common.download"}
            </span>
            <span class="pkp_screen_reader">
                {translate key="common.downloadVideo"}
            </span>
        </a>
        <!-- Título de la página -->
        <h1>{$title|escape}</h1>
    </header>
    <!-- Espacio adicional -->
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <!-- Contenedor del video -->
    <div id="videoCanvasContainer" class="galley_view{if !$isLatestPublication} galley_view_with_notice{/if}">
        <div class="video-container">
            <!-- Reproductor de video usando Video.js -->
            <video id="video-js" class="video-js vjs-default-skin" controls preload="auto" title="{$galleyTitle}" data-setup="{}">
                <source src="{$videoUrl}" type="video/mp4">
                <p class="vjs-no-js">
                    {translate key="plugins.generic.videoJsViewer.noJsMessage"}
                </p>
            </video>
        </div>
    </div>
    <!-- Espacio adicional -->
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <!-- Contenido adicional -->
    <div class="content">
        <h1>{$page_title|escape}</h1>
        <h3>{translate key="author.name"}: {$author->getFullName()}</h3>
        <p><strong>{translate key="article.abstract"}:</strong> {$submission->getLocalizedAbstract()}</p>
        <p><strong>{translate key="article.publicationDate"}:</strong> {$datePublished|date_format:"%B %e, %Y"}</p>
    </div>
</body>
</html>
