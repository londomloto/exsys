<?php
namespace Micro\File;

class FileProvider {

    public function exists($path) {
        return file_exists($path) && ! is_dir($path);
    }

    public function download($file, $name = NULL) {
        $info = getimagesize($file);
        $mime = $info['mime'];

        if (is_null($name)) {
            $info = pathinfo($file);
            $name = '';

            if (isset($info['filename'])) {
                $name .= $info['filename'];
            }

            if (isset($info['extension'])) {
                $name .= '.'.$info['extension'];
            }
        }

        // header('Set-Cookie: downloadtoken=finish; path=/');
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("Cache-Control: public");
        header("Content-Description: File Transfer");
        header("Content-type: ".$mime);
        header("Content-Disposition: attachment; filename=\"".$name."\"");
        header("Content-Transfer-Encoding: binary");
        header("Content-Length: ".filesize($file));
        header("X-Download-Status: finish");

        ob_start();

        if ($stream = fopen($file, 'r')) {
            while ( ! feof($stream)) {
                echo fread($stream, 1024);
                ob_flush();
                flush();
            }
            fclose($stream);
        }

        ob_end_clean();

        exit();
    }

}