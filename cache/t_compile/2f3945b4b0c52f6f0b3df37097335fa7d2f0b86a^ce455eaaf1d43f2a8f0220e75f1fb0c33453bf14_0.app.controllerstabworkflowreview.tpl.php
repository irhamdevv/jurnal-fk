<?php
/* Smarty version 4.3.1, created on 2025-02-27 10:11:39
  from 'app:controllerstabworkflowreview.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_67c03a5b13d579_48639489',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ce455eaaf1d43f2a8f0220e75f1fb0c33453bf14' => 
    array (
      0 => 'app:controllerstabworkflowreview.tpl',
      1 => 1724443806,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:linkAction/linkAction.tpl' => 1,
  ),
),false)) {
function content_67c03a5b13d579_48639489 (Smarty_Internal_Template $_smarty_tpl) {
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['help'][0], array( array('file'=>"editorial-workflow/review",'class'=>"pkp_help_tab"),$_smarty_tpl ) );?>


<?php echo '<script'; ?>
 type="text/javascript">
	// Attach the JS file tab handler.
	$(function() {
		$('#reviewTabs').pkpHandler(
			'$.pkp.controllers.TabHandler',
			{
				<?php $_smarty_tpl->_assignInScope('roundIndex', $_smarty_tpl->tpl_vars['lastReviewRoundNumber']->value-1);?>
				selected: <?php echo $_smarty_tpl->tpl_vars['roundIndex']->value;?>
,
				disabled: [<?php echo $_smarty_tpl->tpl_vars['lastReviewRoundNumber']->value;?>
]
			}
		);
	});
<?php echo '</script'; ?>
>

<?php if ($_smarty_tpl->tpl_vars['reviewRounds']->value) {?>
	<div id="reviewTabs" class="pkp_controllers_tab">
		<ul>
			<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['reviewRounds']->value, 'reviewRound');
$_smarty_tpl->tpl_vars['reviewRound']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['reviewRound']->value) {
$_smarty_tpl->tpl_vars['reviewRound']->do_else = false;
?>
				<li>
					<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_COMPONENT') ? constant('ROUTE_COMPONENT') : null),'component'=>"tab.workflow.ReviewRoundTabHandler",'op'=>$_smarty_tpl->tpl_vars['reviewRoundOp']->value,'submissionId'=>$_smarty_tpl->tpl_vars['submission']->value->getId(),'stageId'=>$_smarty_tpl->tpl_vars['reviewRound']->value->getStageId(),'reviewRoundId'=>$_smarty_tpl->tpl_vars['reviewRound']->value->getId()),$_smarty_tpl ) );?>
"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submission.round",'round'=>$_smarty_tpl->tpl_vars['reviewRound']->value->getRound()),$_smarty_tpl ) );?>
</a>
				</li>
			<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
			<?php if ($_smarty_tpl->tpl_vars['newRoundAction']->value) {?>
				<li>
					<?php $_smarty_tpl->_subTemplateRender("app:linkAction/linkAction.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('image'=>"add_item",'action'=>$_smarty_tpl->tpl_vars['newRoundAction']->value,'contextId'=>"newRoundTabContainer"), 0, false);
?>
				</li>
			<?php }?>
		</ul>
	</div>

	<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'queriesGridUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_COMPONENT') ? constant('ROUTE_COMPONENT') : null),'component'=>"grid.queries.QueriesGridHandler",'op'=>"fetchGrid",'submissionId'=>$_smarty_tpl->tpl_vars['submission']->value->getId(),'stageId'=>$_smarty_tpl->tpl_vars['stageId']->value,'escape'=>false),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
	<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_url_in_div'][0], array( array('id'=>"queriesGrid",'url'=>$_smarty_tpl->tpl_vars['queriesGridUrl']->value),$_smarty_tpl ) );?>

<?php } else { ?>
	<p><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"editor.review.notInitiated"),$_smarty_tpl ) );?>
</p>
<?php }?>
</div>
<?php }
}
