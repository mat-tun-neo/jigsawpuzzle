<?php
class File extends Base
{
    // POST値
    private $post_ary;
    // PNGディレクトリ
    private $png_dir = "./images/character/";

    // コンストラクタ
    public function __construct($post_ary)
    {
        // デバッグ情報
        $this->debug_log("POST値", $post_ary);
        $this->classname = get_class($this);
        $this->post_ary = $post_ary;
    }

    // ファイル情報取得
    public function getFileInfo() 
    {
        $this->methodname = __FUNCTION__;
        setlocale(LC_ALL, 'ja_JP.UTF-8');
        //PNGファイル一覧を取得
        $png_files = glob($this->png_dir . "*.png");
        // PNGファイル選定
        $char_regex = $this->post_ary['char_regex'];
        $png_files_selected = preg_grep("/$char_regex/u", $png_files);
        $png_file = $png_files[ array_rand($png_files_selected) ];
        $png_file_base = basename($png_file, ".png");
        // JSON作成
        $json_buf = array();
        $json_buf["answer"] = $png_file_base;
        $json_buf["size"] = getimagesize($png_file);
        // デバッグ情報
        //$this->debug_log("png_files", $png_files);
        $this->debug_log("png_files_selected", $png_files_selected);
        $this->debug_log("$json_buf", $json_buf);
        return $json_buf;
    }
}
?>