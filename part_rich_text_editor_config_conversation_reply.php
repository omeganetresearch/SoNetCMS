<?php

$result = mysql_query("SELECT username FROM autoSaveContent WHERE username = '{$_SESSION['username']}'");

if (mysql_num_rows($result) > 0) {

	$richTextEditorConfig .= "		\n";
	$richTextEditorConfig .= "		customConfig : '/assets/core/resources/javascript/ckeditor/config_conversation_reply_autosave.js'\n";
	
} else {
	
	$richTextEditorConfig .= "		\n";
	$richTextEditorConfig .= "		customConfig : '/assets/core/resources/javascript/ckeditor/config_conversation_reply.js'\n";
	
}

?>


