<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit8d6b063665bcbea40ad7934a98f86d60
{
    public static $prefixLengthsPsr4 = array (
        'Z' => 
        array (
            'Zend\\' => 5,
        ),
        'P' => 
        array (
            'PhpOffice\\PhpWord\\' => 18,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Zend\\' => 
        array (
            0 => __DIR__ . '/..' . '/zendframework/zendframework/library/Zend',
        ),
        'PhpOffice\\PhpWord\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpoffice/phpword/src/PhpWord',
        ),
    );

    public static $prefixesPsr0 = array (
        'Z' => 
        array (
            'ZendXml\\' => 
            array (
                0 => __DIR__ . '/..' . '/zendframework/zendxml/library',
            ),
        ),
        'T' => 
        array (
            'TwbBundle' => 
            array (
                0 => __DIR__ . '/..' . '/neilime/zf2-twb-bundle/src',
            ),
        ),
        'P' => 
        array (
            'PHPExcel' => 
            array (
                0 => __DIR__ . '/..' . '/phpoffice/phpexcel/Classes',
            ),
        ),
        'D' => 
        array (
            'DOMPDFModule' => 
            array (
                0 => __DIR__ . '/..' . '/dino/dompdf-module/src',
            ),
        ),
        'A' => 
        array (
            'AssetsBundle' => 
            array (
                0 => __DIR__ . '/..' . '/neilime/zf2-assets-bundle/src',
            ),
        ),
    );

    public static $classMap = array (
        'Absolute_Positioner' => __DIR__ . '/..' . '/dompdf/dompdf/include/absolute_positioner.cls.php',
        'Abstract_Renderer' => __DIR__ . '/..' . '/dompdf/dompdf/include/abstract_renderer.cls.php',
        'Adobe_Font_Metrics' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Adobe_Font_Metrics.php',
        'AssetsBundle\\Module' => __DIR__ . '/..' . '/neilime/zf2-assets-bundle/Module.php',
        'Attribute_Translator' => __DIR__ . '/..' . '/dompdf/dompdf/include/attribute_translator.cls.php',
        'Block_Frame_Decorator' => __DIR__ . '/..' . '/dompdf/dompdf/include/block_frame_decorator.cls.php',
        'Block_Frame_Reflower' => __DIR__ . '/..' . '/dompdf/dompdf/include/block_frame_reflower.cls.php',
        'Block_Positioner' => __DIR__ . '/..' . '/dompdf/dompdf/include/block_positioner.cls.php',
        'Block_Renderer' => __DIR__ . '/..' . '/dompdf/dompdf/include/block_renderer.cls.php',
        'CPDF_Adapter' => __DIR__ . '/..' . '/dompdf/dompdf/include/cpdf_adapter.cls.php',
        'CSS_Color' => __DIR__ . '/..' . '/dompdf/dompdf/include/css_color.cls.php',
        'CSSmin' => __DIR__ . '/..' . '/mrclay/minify/min/lib/CSSmin.php',
        'Cached_PDF_Decorator' => __DIR__ . '/..' . '/dompdf/dompdf/include/cached_pdf_decorator.cls.php',
        'Canvas' => __DIR__ . '/..' . '/dompdf/dompdf/include/canvas.cls.php',
        'Canvas_Factory' => __DIR__ . '/..' . '/dompdf/dompdf/include/canvas_factory.cls.php',
        'Cellmap' => __DIR__ . '/..' . '/dompdf/dompdf/include/cellmap.cls.php',
        'DOMPDF' => __DIR__ . '/..' . '/dompdf/dompdf/include/dompdf.cls.php',
        'DOMPDF_Exception' => __DIR__ . '/..' . '/dompdf/dompdf/include/dompdf_exception.cls.php',
        'DOMPDF_Image_Exception' => __DIR__ . '/..' . '/dompdf/dompdf/include/dompdf_image_exception.cls.php',
        'DooDigestAuth' => __DIR__ . '/..' . '/mrclay/minify/min/lib/DooDigestAuth.php',
        'Encoding_Map' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Encoding_Map.php',
        'FirePHP' => __DIR__ . '/..' . '/mrclay/minify/min/lib/FirePHP.php',
        'Fixed_Positioner' => __DIR__ . '/..' . '/dompdf/dompdf/include/fixed_positioner.cls.php',
        'Font' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font.php',
        'Font_Binary_Stream' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Binary_Stream.php',
        'Font_EOT' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_EOT.php',
        'Font_EOT_Header' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_EOT_Header.php',
        'Font_Glyph_Outline' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Glyph_Outline.php',
        'Font_Glyph_Outline_Component' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Glyph_Outline_Component.php',
        'Font_Glyph_Outline_Composite' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Glyph_Outline_Composite.php',
        'Font_Glyph_Outline_Simple' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Glyph_Outline_Simple.php',
        'Font_Header' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Header.php',
        'Font_Metrics' => __DIR__ . '/..' . '/dompdf/dompdf/include/font_metrics.cls.php',
        'Font_OpenType' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_OpenType.php',
        'Font_OpenType_Table_Directory_Entry' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_OpenType_Table_Directory_Entry.php',
        'Font_Table' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Table.php',
        'Font_Table_Directory_Entry' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Table_Directory_Entry.php',
        'Font_Table_cmap' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Table_cmap.php',
        'Font_Table_glyf' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Table_glyf.php',
        'Font_Table_head' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Table_head.php',
        'Font_Table_hhea' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Table_hhea.php',
        'Font_Table_hmtx' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Table_hmtx.php',
        'Font_Table_kern' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Table_kern.php',
        'Font_Table_loca' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Table_loca.php',
        'Font_Table_maxp' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Table_maxp.php',
        'Font_Table_name' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Table_name.php',
        'Font_Table_name_Record' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Table_name_Record.php',
        'Font_Table_os2' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Table_os2.php',
        'Font_Table_post' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_Table_post.php',
        'Font_TrueType' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_TrueType.php',
        'Font_TrueType_Collection' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_TrueType_Collection.php',
        'Font_TrueType_Header' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_TrueType_Header.php',
        'Font_TrueType_Table_Directory_Entry' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_TrueType_Table_Directory_Entry.php',
        'Font_WOFF' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_WOFF.php',
        'Font_WOFF_Header' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_WOFF_Header.php',
        'Font_WOFF_Table_Directory_Entry' => __DIR__ . '/..' . '/phenx/php-font-lib/classes/Font_WOFF_Table_Directory_Entry.php',
        'Frame' => __DIR__ . '/..' . '/dompdf/dompdf/include/frame.cls.php',
        'FrameList' => __DIR__ . '/..' . '/dompdf/dompdf/include/frame.cls.php',
        'FrameListIterator' => __DIR__ . '/..' . '/dompdf/dompdf/include/frame.cls.php',
        'FrameTreeIterator' => __DIR__ . '/..' . '/dompdf/dompdf/include/frame.cls.php',
        'FrameTreeList' => __DIR__ . '/..' . '/dompdf/dompdf/include/frame.cls.php',
        'Frame_Decorator' => __DIR__ . '/..' . '/dompdf/dompdf/include/frame_decorator.cls.php',
        'Frame_Factory' => __DIR__ . '/..' . '/dompdf/dompdf/include/frame_factory.cls.php',
        'Frame_Reflower' => __DIR__ . '/..' . '/dompdf/dompdf/include/frame_reflower.cls.php',
        'Frame_Tree' => __DIR__ . '/..' . '/dompdf/dompdf/include/frame_tree.cls.php',
        'GD_Adapter' => __DIR__ . '/..' . '/dompdf/dompdf/include/gd_adapter.cls.php',
        'HTTP_ConditionalGet' => __DIR__ . '/..' . '/mrclay/minify/min/lib/HTTP/ConditionalGet.php',
        'HTTP_Encoder' => __DIR__ . '/..' . '/mrclay/minify/min/lib/HTTP/Encoder.php',
        'Image_Cache' => __DIR__ . '/..' . '/dompdf/dompdf/include/image_cache.cls.php',
        'Image_Frame_Decorator' => __DIR__ . '/..' . '/dompdf/dompdf/include/image_frame_decorator.cls.php',
        'Image_Frame_Reflower' => __DIR__ . '/..' . '/dompdf/dompdf/include/image_frame_reflower.cls.php',
        'Image_Renderer' => __DIR__ . '/..' . '/dompdf/dompdf/include/image_renderer.cls.php',
        'Inline_Frame_Decorator' => __DIR__ . '/..' . '/dompdf/dompdf/include/inline_frame_decorator.cls.php',
        'Inline_Frame_Reflower' => __DIR__ . '/..' . '/dompdf/dompdf/include/inline_frame_reflower.cls.php',
        'Inline_Positioner' => __DIR__ . '/..' . '/dompdf/dompdf/include/inline_positioner.cls.php',
        'Inline_Renderer' => __DIR__ . '/..' . '/dompdf/dompdf/include/inline_renderer.cls.php',
        'JSCompilerContext' => __DIR__ . '/..' . '/mrclay/minify/min/lib/JSMinPlus.php',
        'JSMin' => __DIR__ . '/..' . '/mrclay/minify/min/lib/JSMin.php',
        'JSMinPlus' => __DIR__ . '/..' . '/mrclay/minify/min/lib/JSMinPlus.php',
        'JSMin_UnterminatedCommentException' => __DIR__ . '/..' . '/mrclay/minify/min/lib/JSMin.php',
        'JSMin_UnterminatedRegExpException' => __DIR__ . '/..' . '/mrclay/minify/min/lib/JSMin.php',
        'JSMin_UnterminatedStringException' => __DIR__ . '/..' . '/mrclay/minify/min/lib/JSMin.php',
        'JSNode' => __DIR__ . '/..' . '/mrclay/minify/min/lib/JSMinPlus.php',
        'JSParser' => __DIR__ . '/..' . '/mrclay/minify/min/lib/JSMinPlus.php',
        'JSToken' => __DIR__ . '/..' . '/mrclay/minify/min/lib/JSMinPlus.php',
        'JSTokenizer' => __DIR__ . '/..' . '/mrclay/minify/min/lib/JSMinPlus.php',
        'Javascript_Embedder' => __DIR__ . '/..' . '/dompdf/dompdf/include/javascript_embedder.cls.php',
        'Line_Box' => __DIR__ . '/..' . '/dompdf/dompdf/include/line_box.cls.php',
        'List_Bullet_Frame_Decorator' => __DIR__ . '/..' . '/dompdf/dompdf/include/list_bullet_frame_decorator.cls.php',
        'List_Bullet_Frame_Reflower' => __DIR__ . '/..' . '/dompdf/dompdf/include/list_bullet_frame_reflower.cls.php',
        'List_Bullet_Image_Frame_Decorator' => __DIR__ . '/..' . '/dompdf/dompdf/include/list_bullet_image_frame_decorator.cls.php',
        'List_Bullet_Positioner' => __DIR__ . '/..' . '/dompdf/dompdf/include/list_bullet_positioner.cls.php',
        'List_Bullet_Renderer' => __DIR__ . '/..' . '/dompdf/dompdf/include/list_bullet_renderer.cls.php',
        'Minify' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify.php',
        'Minify_Build' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Build.php',
        'Minify_CSS' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/CSS.php',
        'Minify_CSS_Compressor' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/CSS/Compressor.php',
        'Minify_CSS_UriRewriter' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/CSS/UriRewriter.php',
        'Minify_CSSmin' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/CSSmin.php',
        'Minify_Cache_APC' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Cache/APC.php',
        'Minify_Cache_File' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Cache/File.php',
        'Minify_Cache_Memcache' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Cache/Memcache.php',
        'Minify_Cache_WinCache' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Cache/WinCache.php',
        'Minify_Cache_XCache' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Cache/XCache.php',
        'Minify_Cache_ZendPlatform' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Cache/ZendPlatform.php',
        'Minify_ClosureCompiler' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/ClosureCompiler.php',
        'Minify_ClosureCompiler_Exception' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/ClosureCompiler.php',
        'Minify_CommentPreserver' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/CommentPreserver.php',
        'Minify_Controller_Base' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Controller/Base.php',
        'Minify_Controller_Files' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Controller/Files.php',
        'Minify_Controller_Groups' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Controller/Groups.php',
        'Minify_Controller_MinApp' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Controller/MinApp.php',
        'Minify_Controller_Page' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Controller/Page.php',
        'Minify_Controller_Version1' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Controller/Version1.php',
        'Minify_DebugDetector' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/DebugDetector.php',
        'Minify_HTML' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/HTML.php',
        'Minify_HTML_Helper' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/HTML/Helper.php',
        'Minify_ImportProcessor' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/ImportProcessor.php',
        'Minify_JS_ClosureCompiler' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/JS/ClosureCompiler.php',
        'Minify_JS_ClosureCompiler_Exception' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/JS/ClosureCompiler.php',
        'Minify_Lines' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Lines.php',
        'Minify_Loader' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Loader.php',
        'Minify_Logger' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Logger.php',
        'Minify_Packer' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Packer.php',
        'Minify_Source' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/Source.php',
        'Minify_YUICompressor' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/YUICompressor.php',
        'Minify_YUI_CssCompressor' => __DIR__ . '/..' . '/mrclay/minify/min/lib/Minify/YUI/CssCompressor.php',
        'MrClay\\Cli' => __DIR__ . '/..' . '/mrclay/minify/min/lib/MrClay/Cli.php',
        'MrClay\\Cli\\Arg' => __DIR__ . '/..' . '/mrclay/minify/min/lib/MrClay/Cli/Arg.php',
        'Null_Frame_Decorator' => __DIR__ . '/..' . '/dompdf/dompdf/include/null_frame_decorator.cls.php',
        'Null_Frame_Reflower' => __DIR__ . '/..' . '/dompdf/dompdf/include/null_frame_reflower.cls.php',
        'Null_Positioner' => __DIR__ . '/..' . '/dompdf/dompdf/include/null_positioner.cls.php',
        'PDFLib_Adapter' => __DIR__ . '/..' . '/dompdf/dompdf/include/pdflib_adapter.cls.php',
        'PHP_Evaluator' => __DIR__ . '/..' . '/dompdf/dompdf/include/php_evaluator.cls.php',
        'Page_Cache' => __DIR__ . '/..' . '/dompdf/dompdf/include/page_cache.cls.php',
        'Page_Frame_Decorator' => __DIR__ . '/..' . '/dompdf/dompdf/include/page_frame_decorator.cls.php',
        'Page_Frame_Reflower' => __DIR__ . '/..' . '/dompdf/dompdf/include/page_frame_reflower.cls.php',
        'Positioner' => __DIR__ . '/..' . '/dompdf/dompdf/include/positioner.cls.php',
        'Renderer' => __DIR__ . '/..' . '/dompdf/dompdf/include/renderer.cls.php',
        'Style' => __DIR__ . '/..' . '/dompdf/dompdf/include/style.cls.php',
        'Stylesheet' => __DIR__ . '/..' . '/dompdf/dompdf/include/stylesheet.cls.php',
        'TCPDF_Adapter' => __DIR__ . '/..' . '/dompdf/dompdf/include/tcpdf_adapter.cls.php',
        'Table_Cell_Frame_Decorator' => __DIR__ . '/..' . '/dompdf/dompdf/include/table_cell_frame_decorator.cls.php',
        'Table_Cell_Frame_Reflower' => __DIR__ . '/..' . '/dompdf/dompdf/include/table_cell_frame_reflower.cls.php',
        'Table_Cell_Positioner' => __DIR__ . '/..' . '/dompdf/dompdf/include/table_cell_positioner.cls.php',
        'Table_Cell_Renderer' => __DIR__ . '/..' . '/dompdf/dompdf/include/table_cell_renderer.cls.php',
        'Table_Frame_Decorator' => __DIR__ . '/..' . '/dompdf/dompdf/include/table_frame_decorator.cls.php',
        'Table_Frame_Reflower' => __DIR__ . '/..' . '/dompdf/dompdf/include/table_frame_reflower.cls.php',
        'Table_Row_Frame_Decorator' => __DIR__ . '/..' . '/dompdf/dompdf/include/table_row_frame_decorator.cls.php',
        'Table_Row_Frame_Reflower' => __DIR__ . '/..' . '/dompdf/dompdf/include/table_row_frame_reflower.cls.php',
        'Table_Row_Group_Frame_Decorator' => __DIR__ . '/..' . '/dompdf/dompdf/include/table_row_group_frame_decorator.cls.php',
        'Table_Row_Group_Frame_Reflower' => __DIR__ . '/..' . '/dompdf/dompdf/include/table_row_group_frame_reflower.cls.php',
        'Table_Row_Group_Renderer' => __DIR__ . '/..' . '/dompdf/dompdf/include/table_row_group_renderer.cls.php',
        'Table_Row_Positioner' => __DIR__ . '/..' . '/dompdf/dompdf/include/table_row_positioner.cls.php',
        'Text_Frame_Decorator' => __DIR__ . '/..' . '/dompdf/dompdf/include/text_frame_decorator.cls.php',
        'Text_Frame_Reflower' => __DIR__ . '/..' . '/dompdf/dompdf/include/text_frame_reflower.cls.php',
        'Text_Renderer' => __DIR__ . '/..' . '/dompdf/dompdf/include/text_renderer.cls.php',
        'TwbBundle\\Module' => __DIR__ . '/..' . '/neilime/zf2-twb-bundle/Module.php',
        'LosPdf\\Module' => __DIR__ . '/..' . '/lospdf/Module.php',
        'mPDF' => __DIR__ . '/..' . '/mpdf/mpdf.php',
        'lessc' => __DIR__ . '/..' . '/neilime/lessphp/lessc.inc.php',
        'lessc_formatter_classic' => __DIR__ . '/..' . '/neilime/lessphp/lessc.inc.php',
        'lessc_formatter_compressed' => __DIR__ . '/..' . '/neilime/lessphp/lessc.inc.php',
        'lessc_formatter_lessjs' => __DIR__ . '/..' . '/neilime/lessphp/lessc.inc.php',
        'lessc_parser' => __DIR__ . '/..' . '/neilime/lessphp/lessc.inc.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit8d6b063665bcbea40ad7934a98f86d60::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit8d6b063665bcbea40ad7934a98f86d60::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInit8d6b063665bcbea40ad7934a98f86d60::$prefixesPsr0;
            $loader->classMap = ComposerStaticInit8d6b063665bcbea40ad7934a98f86d60::$classMap;

        }, null, ClassLoader::class);
    }
}
