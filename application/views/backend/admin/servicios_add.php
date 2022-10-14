
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-primary" data-collapsed="0">
            <div class="panel-heading">
                <div class="panel-title">
                    <i class="entypo-plus-circled"></i>
                    <?php echo get_phrase('Agregar servicio'); ?>
                </div>
            </div>
            <div class="panel-body">

                <?php echo form_open(site_url('admin/servicios/create/'.$param2), array('class' => 'form-horizontal form-groups-bordered validate project-bug-add', 'enctype' => 'multipart/form-data')); ?>

                <div class="form-group"> 
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('title'); ?></label>

                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="name" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                    </div>
                   
                </div>

                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('description'); ?></label>

                    <div class="col-sm-7">
                        <textarea class="form-control" name="description"></textarea>
                    </div>

                </div>
                
                
                <div class="form-group">
                    <label for="field-1" class="col-sm-3 control-label">Precio</label>   
                    <div class="col-sm-7">
                       <input type="text" class="form-control" name="precio" data-validate="required" data-message-required="<?php echo get_phrase('value_required'); ?>" value="" autofocus>
                    </div>
                </div> 
                


                <div class="form-group">
                            <label for="field-1" class="col-sm-4 control-label"><?php echo get_phrase('select_file'); ?></label>

                            <div class="col-sm-6">
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <span class="btn btn-primary btn-file">
                                        <span class="fileinput-new"><?php echo get_phrase('choose'); ?></span>
                                        <span class="fileinput-exists"><?php echo get_phrase('change'); ?></span>
                                        <input type="file" name="userfile" id="userfile">
                                    </span>
                                    <span class="fileinput-filename"></span>
                                    <a href="#" class="close fileinput-exists" data-dismiss="fileinput" style="float: none">&times;</a>
                                </div>
                            </div>
                        </div>
                <?php
                    $products	=	$this->db->get('product')->result_array();
                ?>
                <br>
                <h4>Agregar Productos</h4>
                <br>

                <select class="form-control" id="product_select">
                    <option hidden disabled selected value> -- select an option -- </option>
                        <?php foreach ($products as $product) : ?>
                            <option value="<?php echo $product['product_id']; ?>"><?php echo $product['Nombre']; ?></option>
                        <?php endforeach; ?>
                        </select>
                <br>
                <button class="btn btn-outline-success" type="button" onclick="newProduct();"> New Product</button>
                <br><br>
                <table id="table_alcohol">
                    <tr>
                        <td style="width: 30%;">Nombre</td>
                        <td style="width: 50%;">Cantidad</td>
                </tr>
                    
                </table>


                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-7">
                        <button type="submit" class="btn btn-info" ><?php echo get_phrase('submit'); ?></button>
                        <span id="preloader-form"></span>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    const products = [];
    const serviceProducts = [];
    const productsUpdate = [];
    <?php foreach ($products as $product) : ?>
        products.push(<?php echo json_encode($product); ?>);
    <?php endforeach; ?>
   
    function newProduct(){
        var producto = document.getElementById("product_select").value;
        var ind = products.findIndex(i => i.product_id == producto);
        serviceProducts.push({id_product : producto, quantity: 0, left_quantity : products[ind].existencia});
        productsUpdate.push({id : producto, quantity : products[ind].existencia});
        var myTable = document.getElementById("table_alcohol"); 
        var row = myTable.insertRow(myTable.rows.length);
        row.id = myTable.rows.length;
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        cell1.innerHTML = `<h5 style="margin-top: 10px;" id="type${row.id}"> ${products[ind].Nombre}</h5>`
        cell2.innerHTML = `<input type="number" max="${products[ind].existencia }" style="margin-top: 10px;" id="product${row.id}" onchange="change(${row.id},${products[ind].existencia });" class="form-control"  ></input>`
    }
    function change(idx, quantity){
        id ="product"+idx;
        var auxtype = document.getElementById(id).value;
        var rest = quantity - auxtype;
        serviceProducts[idx-2].quantity = auxtype;
        serviceProducts[idx-2].left_quantity = rest;
    }
    $('form').submit(function() {

        let sanitizeProducts = JSON.stringify(serviceProducts).replace(/'/g, '"');
        $('form').append(`<input hidden name="serviceProducts" value='${sanitizeProducts}' /> `);

        // let sanitize = JSON.stringify(productsUpdate).replace(/'/g, '"');
        // $('form').append(`<input hidden name="productsUpdate" value='${sanitize}' /> `);

        return true;
    });
</script>

