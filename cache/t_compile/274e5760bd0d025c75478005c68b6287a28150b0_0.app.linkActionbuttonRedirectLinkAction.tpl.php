<?php
/* Smarty version 4.3.1, created on 2025-02-27 10:10:53
  from 'app:linkActionbuttonRedirectLinkAction.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_67c03a2d3a3113_63577693',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '274e5760bd0d025c75478005c68b6287a28150b0' => 
    array (
      0 => 'app:linkActionbuttonRedirectLinkAction.tpl',
      1 => 1724443806,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_67c03a2d3a3113_63577693 (Smarty_Internal_Template $_smarty_tpl) {
echo '<script'; ?>
>
	$(function() {
		$('<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['buttonSelector']->value,'javascript' ));?>
').pkpHandler(
				'$.pkp.controllers.linkAction.LinkActionHandler',
				{
					actionRequest: '$.pkp.classes.linkAction.RedirectRequest',
					actionRequestOptions: {
						url: <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'json_encode' ][ 0 ], array( $_smarty_tpl->tpl_vars['cancelUrl']->value ));?>
,
						name: <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'json_encode' ][ 0 ], array( $_smarty_tpl->tpl_vars['cancelUrlTarget']->value ));?>

					},
			});
	});
<?php echo '</script'; ?>
>
<?php }
}
