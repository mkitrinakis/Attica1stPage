<my-notes>
	<div class="popup">
		<div class="popup-title voda-light">
			<div class="aclose-button aclose-button-big" onclick="{ parent.hide_panel }"></div>
			<span if="{ note }">Λεπτομέρειες Επικοινωνίας</span>
			<span if="{ !note }">Φόρμες Επικοινωνίας</span>
		</div>
		<br clear="all">
		<div class="actual-note" if="{ note }">
			<span if="{ loading }">Loading....</span>
			<div if="{ !loading }">
				<sre-raw html="{ HTML }"></sre-raw>
			</div>
		</div>
		<div style="text-align: right" if="{ note }">
			<a class="vodafone-button" onclick="{ back }" style="cursor:pointer">Επιστροφή στη λίστα</a>
		</div>

		<div class="actual-note" if="{ !note }">
			<div class="anote" each="{ note in my_notes }" onclick="{ show_note }">
				<span class="date voda-light">{ note.date }</span>
				<div class="title voda">
					<span class="bullet { note.is_new ? 'new' : ''}"></span>
					{ note.title }, by { note.user }  
				</div>
			</div>
		</div>
	</div>



	<style>
		.popup {
			min-width: 860px;
			position: absolute;
			top:50%;
			left:50%;
			transform: translate(-50%, -50%);
			background:#333;
			color:#fff;
			padding:20px;
			z-index: 2001;
		}
		.popup-title {
			font-size:40px;
			padding-left:10px;
		}
		.anote {
			font-size:18px;
			padding:10px;
			padding-top:0;
			cursor:pointer;
		}
		.actual-note {
			max-height:60vh;
			overflow-y: auto;
			margin-bottom: 10px
		}
		.actual-note .back {
			text-align: right;
			font-size:20px;
			font-weight: bold
		}

		.bullet {display:inline-block; width:12px; height:12px; border-radius:50%; margin-right:5px;}
		.bullet.new { background:#e30000; }

		.anote:hover {
			background:#111;
		}
		.anote.plain {
			cursor:default;
			padding-bottom:40px;
		}
		.anote.plain:hover {
			background:none!important
		}
		.anote.plain .title {
			margin-bottom: 10px;
			font-size: 24px;
			padding:5px;
			background-color:#222;
		}

		.anote.plain .date {
			transform: translate(-10px, 10px)
		}
		
		.anote.plain .contents {
			margin-left:20px;
		}
		.anote.plain .files:before {
			position: absolute;
			left:5px;
			content:"Συνημμένα";
			color:#888;
		}
		.anote.plain .files {
			position:relative;
			margin-top:10px;
			padding:5px;
			background:#2a2a2a;
			text-align: right;
			color:#ccc;
		}
		.anote.plain .files a {
			display:inline-block;
			margin-right:10px;
			text-decoration:underline;
		}

		.anote .newitem {
			display:inline-block;
			margin-right:10px;
			color:#f99;
			font-weight:bold
		}
		.anote .date {
			float: right;
		}
	</style>

	<script>
		var tag = this;
		this.loading = false;
		this.note = this.opts.note;
		this.HTML = '';

		this.show_note = function(event) {
			tag.loading = true;
			tag.note = event.item.note.id;
			tag.loadNote();
		}

		this.back = function() {
			tag.loading = false;
			tag.HTML = '';
			tag.note = 0;
		}

		this.loadNote = function() {
			qwest.post(tag.opts.notedetailsurl, {
				id: tag.note
			}).then(function(xhr, result) {
				my_notes.map(function(item) {
					if (item.id == tag.note) {
						item.is_new = false;
					}
				})
				tag.loading = false;
				tag.HTML = result;
				tag.update();
			})
		}

		if (this.note) {
			this.loadNote();
		}
	</script>


</my-notes>

