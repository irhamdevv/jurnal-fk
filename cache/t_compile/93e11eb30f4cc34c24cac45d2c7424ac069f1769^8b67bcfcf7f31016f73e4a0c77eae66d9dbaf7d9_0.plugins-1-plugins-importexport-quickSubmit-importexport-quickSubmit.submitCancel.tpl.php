<?php
/* Smarty version 4.3.1, created on 2025-02-27 11:54:06
  from 'plugins-1-plugins-importexport-quickSubmit-importexport-quickSubmit:submitCancel.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_67c0525ede5370_18399907',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8b67bcfcf7f31016f73e4a0c77eae66d9dbaf7d9' => 
    array (
      0 => 'plugins-1-plugins-importexport-quickSubmit-importexport-quickSubmit:submitCancel.tpl',
      1 => 1740465849,
      2 => 'plugins-1-plugins-importexport-quickSubmit-importexport-quickSubmit',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_67c0525ede5370_18399907 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_86206883567c0525ede25b4_13844043', "page");
?>

<?php $_smarty_tpl->inheritance->endChild($_smarty_tpl, "layouts/backend.tpl");
}
/* {block "page"} */
class Block_86206883567c0525ede25b4_13844043 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'page' => 
  array (
    0 => 'Block_86206883567c0525ede25b4_13844043',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<h1 class="app__pageHeading">
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.importexport.quickSubmit.cancel"),$_smarty_tpl ) );?>

	</h1>

	<div class="app__contentPanel">
		<p>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.importexport.quickSubmit.cancelDescription"),$_smarty_tpl ) );?>

		</p>
		<p>
			<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['plugin_url'][0], array( array(),$_smarty_tpl ) );?>
">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.importexport.quickSubmit.successReturn"),$_smarty_tpl ) );?>

			</a>
		</p>
	</div>
<?php
}
}
/* {/block "page"} */
}
