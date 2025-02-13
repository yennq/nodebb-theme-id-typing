<!-- logged out menu -->
{{{ if !config.loggedIn }}}
<li class="">
	<h6 class="mb-2 text-uppercase pointer fw-bold d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
	[[global:header.account]]
	</h6>
	<div class="collapse show" id="account-collapse">
		<ul class="btn-sm-toggle-nav list-unstyled fw-normal pb-1 small">
			<li><a href="{config.relative_path}/register" class="btn-sm btn-sm-ghost">[[global:register]]</a></li>
			<li><a href="{config.relative_path}/login" class="btn-sm btn-sm-ghost">[[global:login]]</a></li>
		</ul>
	</div>
</li>
{{{ end }}}
