<!-- IMPORT partials/account/header.tpl -->
<div class="d-flex gap-3 justify-content-between mb-2 align-items-center">
	<h1 class="fs-4 mb-0">[[pages:account/blocks, {username}]]</h1>
	<div class="">
		<div class="dropdown">
			<input class="form-control" type="text" id="user-search" placeholder="[[users:enter-username]]" data-bs-toggle="dropdown" autocomplete="off" aria-haspopup="true" aria-expanded="false"/>

			<ul component="blocks/search/list" class="dropdown-menu p-1 block-edit list-unstyled" role="menu">
				<li component="blocks/start-typing">
					<a href="#" class="dropdown-item rounded-0" role="menuitem">[[admin/menu:search.start-typing]]</a>
				</li>
				<li component="blocks/no-users" class="hidden">
					<a href="#" class="dropdown-item rounded-0" role="menuitem">[[users:no-users-found]]</a>
				</li>
				{{{ each edit }}}
				<li component="blocks/search/match">
					<div class="dropdown-item rounded-0 d-flex flex-nowrap gap-2 justify-content-between align-items-center" role="menuitem">
						<div class="text-truncate">
							<a href="{config.relative_path}/uid/{../uid}">{buildAvatar(edit, "24px", true)} {../username}</a>
						</div>

						<button class="btn btn-sm btn-outline-danger text-nowrap {{{ if ./isBlocked }}}hidden{{{ end }}}" data-uid="{./uid}" data-action="block">[[user:block-user]]</button>
						<button class="btn btn-sm btn-outline-primary text-nowrap {{{ if !./isBlocked }}}hidden{{{ end }}}" data-uid="{./uid}" data-action="unblock">[[user:unblock-user]]</button>
					</div>
				</li>
				{{{ end }}}
			</ul>
		</div>
	</div>
</div>

<div class="users row">
	<div class="alert alert-warning text-center {{{ if users.length }}}hidden{{{ end }}}">[[user:has-no-blocks]]</div>
	<div id="users-container" class="row row-cols-2 row-cols-md-3 row-cols-xl-4 g-3 users-container mb-4">
		{{{ each users }}}
		<div class="d-flex flex-column gap-1">
			<!-- IMPORT partials/users/item.tpl -->
			<button class="btn btn-sm btn-outline-primary text-nowrap mx-auto" data-uid="{./uid}" data-action="unblock">[[user:unblock-user]]</button>
		</div>
		{{{ end }}}

		<!-- IMPORT partials/paginator.tpl -->
	</div>
</div>

<!-- IMPORT partials/account/footer.tpl -->
