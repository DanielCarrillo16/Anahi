<center>
	<h3><?php echo get_phrase('summary_report');?> </h3>
</center>
<br>

<div class="panel panel-primary" id="charts_env">
	<div class="panel-heading">
		<div class="panel-title">
			<i class="fa fa-building"></i>
			<?php echo get_phrase('Comparación de ingresos y gastos');?>
		</div>
	</div>
	<div class="panel-body" >
	    <div class="table-responsive">
		<table class="table   datatable" id="table_export">
			<thead>
				<tr>
		        	<th>#</th>
					<th><div><?php echo get_phrase('date');?></div></th>
					<th><div><?php echo get_phrase('transaction_source');?></div></th>
					<th><div><?php echo get_phrase('type');?></div></th>
					<th><div><?php echo get_phrase('amount');?></div></th>
				</tr>
			</thead>
			<tbody>
				
				<?php 
				$counter = 1;
				$total_expense	=	0;
				$total_income	=	0;
				$this->db->order_by('timestamp' , 'desc');
				
				$this->db->where('timestamp >=' , $timestamp_start);
				$this->db->where('timestamp <=' , $timestamp_end);
				$payments	=	$this->db->get('payment')->result_array();
				foreach ($payments as $row):
					?>
					<tr>
		            	<td><?php echo $counter; ?></td>
						<td><?php echo date("d M, Y" , $row['timestamp']);?></td>
						<td>
							<?php 
							if ( $row['type'] == 'income' )
							{
								echo $this->db->get_where('project',array('project_code' => $row['project_code']))->row()->title;
								$total_income	+=	$row['amount'];						
							}
							else if ( $row['type'] == 'expense' )
							{
								echo $row['title'];
								$total_expense	+=	$row['amount'];
							}
							?>
						</td>
						<td><?php echo $row['type'];?></td>
						<td><?php echo $currency_symbol . $row['amount'];?></td>
					</tr>

				<?php $counter++; endforeach;?>
			</tbody>
		</table>
		</div>
	</div>
</div>


<div class="row">
	<div class="col-sm-3 col-md-offset-3">
		
		<div class="tile-stats tile-white tile-white-primary">
			<div class="icon" style="bottom:40px;"><i class="entypo-chart-bar"></i></div>
			<div class="num" data-start="0" data-end="<?php echo $total_income;?>" data-prefix="<?php echo $currency_symbol;?>" 
				style="font-weight:200;"	data-postfix="" data-duration="1500" data-delay="0">
				0
			</div>
			
			<h3 style="font-weight:200; font-size: 15px;"><?php echo get_phrase('total_income');?></h3>
		</div>
		
	</div>

	<div class="col-sm-3">
		
		<div class="tile-stats tile-white tile-white-primary">
			<div class="icon" style="bottom:40px;"><i class="entypo-chart-line"></i></div>
			<div class="num" data-start="0" data-end="<?php echo $total_expense;?>" data-prefix="<?php echo $currency_symbol;?>" 
				style="font-weight:200;"	data-postfix="" data-duration="1500" data-delay="0">
				0
			</div>
			
			<h3 style="font-weight:200; font-size: 15px;"><?php echo get_phrase('total_expense');?></h3>
		</div>
		
	</div>
</div>

<script>

var chart = AmCharts.makeChart("chartdiv",{
	"type"			: "pie",
	"titleField"	: "report_type",
	"valueField"	: "amount",
	"innerRadius"	: "40%",
	"angle"			: "15",
	"depth3D"		: 10,
	"pathToImages"	: "<?php echo base_url('assets/js/amcharts/images/');?>",
	"amExport": {
					"top": 0,
                    "right": 0,
                    "buttonColor": '#EFEFEF',
                    "buttonRollOverColor":'#DDDDDD',
					"imageFileName"	: "Project Report",
                    "exportPNG":true,
                    "exportJPG":true,
                    "exportPDF":true,
                    "exportSVG":true
	},
	"dataProvider"	: [
		
		{
			"report_type": "<?php echo get_phrase('expense');?>",
			"amount": <?php echo $total_expense;?>
		},
		{
			"report_type": "<?php echo get_phrase('income');?>",
			"amount": <?php echo $total_income;?>
		},
	]
});
</script>
	










<script type="text/javascript">


	
	jQuery(document).ready(function($)
	{
		//convert all checkboxes before converting datatable
		replaceCheckboxes();
		var datatable = $("#table_export").dataTable({
			"sPaginationType": "bootstrap",
			// "sDom": "<'row'<'col-xs-3 col-left'l><'col-xs-9 col-right'<'export-data'T>f>r>t<'row'<'col-xs-3 col-left'i><'col-xs-9 col-right'p>>",
			
			"aoColumns": [
				{ "bSortable": false}, 
				{ "bSortable": true}, 	
				{ "bVisible": true},		
				{ "bVisible": true},		
				{ "bVisible": true},		
			],
			
		});
		// Highlighted rows
		$("#table_export tbody input[type=checkbox]").each(function(i, el)
		{
			var $this = $(el),
				$p = $this.closest('tr');
			
			$(el).on('change', function()
			{
				var is_checked = $this.is(':checked');
				
				$p[is_checked ? 'addClass' : 'removeClass']('highlight');
			});
		});
		
		//customize the select menu 
		$(".dataTables_wrapper select").select2({
			minimumResultsForSearch: -1
		});
		
	});
	


		
</script>



        
