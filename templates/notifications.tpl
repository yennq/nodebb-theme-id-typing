
<div class="notifications">

	<!-- IMPORT partials/breadcrumbs.tpl -->
	<div class="d-flex gap-2 justify-content-end" role="toolbar">
		<div class="btn-group me-2">
			<button class="btn btn-ghost dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				{{{ if selectedFilter }}}{selectedFilter.name}{{{ end}}} <span class="caret"></span>
			</button>
			<ul class="dropdown-menu dropdown-menu-end p-1" role="menu">
				{{{ each filters }}}
				{{{ if filters.separator }}}
				<li role="separator" class="dropdown-divider"></li>
				{{{ else }}}
				<li role="presentation" class="category">
					<a class="dropdown-item rounded-1 d-flex gap-3 align-items-center justify-content-between" role="menuitem" href="{config.relative_path}/notifications?filter={filters.filter}">
						<span><i class="fa fa-fw {{{ if filters.selected }}}fa-check{{{ end }}}"></i> {filters.name}</span>
						<span class="">{./count}</span>
					</a>
				</li>
				{{{ end }}}
				{{{ end }}}
			</ul>
		</div>

		<button component="notifications/mark_all" class="btn btn-ghost" type="button">
			<i class="fa fa-eye"></i>
			[[notifications:mark-all-read]]
		</button>
	</div>

	<hr />

	<div class="alert alert-info {{{ if notifications.length }}}hidden{{{ end }}}">
		[[notifications:no-notifs]]
	</div>

	<ul component="notifications/list" class="notifications-list list-unstyled" data-nextstart="{nextStart}">
	{{{each notifications}}}
		<li data-nid="{notifications.nid}" class="{notifications.readClass} d-flex mb-2 card card-body rounded-1 border-0 {{{ if !./read}}}unread{{{ end }}}" component="notifications/item">
			<div class="d-flex gap-3">
				<div class="align-self-start">
					{{{ if notifications.from }}}
					{buildAvatar(notifications.user, "64px", false, "rounded")}
					{{{ else }}}
					{{{ if notifications.image }}}
					<img style="width:auto;height: 64px;object-fit: contain;" src="{notifications.image}" />
					{{{ end }}}
					{{{ end }}}
				</div>
				<div class="d-flex flex-column gap-1 flex-grow-1">
					<a component="notifications/item/link" href="{notifications.path}">{notifications.bodyShort}</a>
					<span class="timeago text-sm text-muted" title="{notifications.datetimeISO}"></span>
				</div>
				<div>
					{{{ if ./nid }}}
					<button class="mark-read btn btn-ghost d-flex align-items-center justify-content-center flex-grow-0 flex-shrink-0 p-1" style="width: 1.5rem; height: 1.5rem;">
						<i class="unread fa fa-2xs fa-circle text-primary {{{ if ./read }}}hidden{{{ end }}}" aria-label="[[unread:mark-as-read]]"></i>
						<i class="read fa fa-2xs fa-circle-o text-muted {{{ if !./read }}}hidden{{{ end }}}" aria-label="[[unread:mark-as-unread]]"></i>
					</button>
					{{{ end }}}
				</div>
			</div>
		</li>
	{{{end}}}
	</ul>
	<!-- IMPORT partials/paginator.tpl -->
</div>


