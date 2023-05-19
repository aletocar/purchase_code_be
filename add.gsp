<head>
  <meta name="layout" content="main"/>
  <asset:stylesheet src="margin.css"/>
  <asset:stylesheet src="fonts.css"/>
  <asset:javascript src="purchase/add_purchase.js"/>
  <asset:javascript src="common.js"/>
  <asset:stylesheet src="purchase.css"/>
  <asset:stylesheet src="button.css"/>
  <asset:stylesheet src='table.css'/>
</head>

<body>
<div id="wrapper" class="purchase-show-page">
  <g:include controller="clientEcommerce" action="show"></g:include>
  <div id="page-content-wrapper" class="right-menu">
    <g:render template="/purchase/rightmenu_purchases"/>
    <g:render template="/purchase/add_article"/>
    <div id="page-wrapper">
      <div class="start-container">

        %{-- BUTTONS SECTION --}%

        <div class="row padding-bottom14" style="margin-top: -3%;">
          <div class="col-xs-2 pull-left padding-left0">
            <a id="btn-add-purchase" class="btn btn-primary button width-110">
              GUARDAR NUEVO PEDIDO
            </a>
          </div>

          <div class="col-xs-2 pull-right padding-right0" style="padding-left: 0px">
            <g:link type="button" class="back btn btn-primary button width-100" value="back" action="index"
                    style="background: #FFFFFF; color: #083f56 !important; border-color: #083f56 !important; font-family:RobotoDraftMedium;">
              Volver
            </g:link>
          </div>
        </div>

        <g:form controller="purchase" method="post" action="postAddNewPurchase" name="frm-purchase">

        %{-- PURCHASE INFO SECTION --}%

          <div class="row wrapper-column" style="padding-right: 0px; padding-left: 0px;">
            <div class="col-md-8"
                 style="padding-bottom: 20px; border-bottom-style: solid; border-bottom-color: rgba(128, 128, 128, 0.19); border-bottom-width: 1px;">
              <i class="fa fa-info-circle fa-2x" style="margin-right: 1%" aria-hidden="true"></i>
              <span class="info titleCard">DATOS DEL PEDIDO</span>
            </div>

            <div class="col-md-4 mg-bottom25 text-right"
                 style="padding-bottom: 30px; border-bottom-style: solid; border-bottom-color: rgba(128, 128, 128, 0.19); border-bottom-width: 1px;">
              <h4 id="lbl-purchase-total" class="mg-top0 mg-bottom0" style="color: black; margin-right: 20px;"></h4>
            </div>

            <div class="row" style="padding-right: 2%; padding-left: 2%;">
              <div class="col-md-2 mg-top15">
                <span class="info simple">Identificador del pedido:</span>
              </div>

              <div class="col-md-2">
                <g:if test="${autoIdGeneration}">
                  <input type="text" class="form-control" value="(autogenerado)" disabled />
                </g:if>
                <g:else>
                  <input type="text" class="form-control" id="txt-purchase-id" name="purchaseId" value="${purchaseId}" />
                </g:else>
              </div>

              <div class="col-md-2 text-right mg-top15">
                <span class="info simple mg-left10">Fecha del pedido:</span>
              </div>

              <div class="col-md-2">
                <input id="pkr-purchase-date" name="purchaseDate" type="text" class="form-control"
                       style="cursor: pointer; background-color: white; text-align: center;" readonly/>
              </div>

              <div class="col-md-2 text-right mg-top15">
                <span class="info simple mg-left10">Estado del pedido:</span>
              </div>

              <div class="col-md-2">
                <select id="cmb-purchase-status" name="purchaseStatus" class="form-control">
                  <g:each in="${purchaseStatuses}">
                    <option value="${it.id}">${it.name}</option>
                  </g:each>
                </select>
              </div>
            </div>

            <div class="row" style="padding-right: 2%; padding-left: 2%;">
              <div class="col-md-2 mg-top20">
                <span class="info simple">Comentarios del pedido:</span>
              </div>

              <div class="col-md-10" style="margin-top: 5px;">
                <textarea class="form-control" name="purchaseComments"></textarea>
              </div>
            </div>

            <div class="row" style="padding-right: 2%; padding-left: 2%;">
              <div class="col-md-2 mg-top10">
                <span class="info simple">Información de envío:</span>
              </div>

              <div class="col-md-10 mg-top10">
                <input id="chk-shipping-info" type="checkbox" name="hasShipping"> Este pedido requiere envío</input>
              </div>
            </div>
          </div>

        %{-- PURCHASE LINES INFO SECTION --}%

          <div class="row spacing-big wrapper-column" style="padding-left: 0px; padding-right: 0px;">
            <div class="col-md-10 mg-bottom25"
                 style="padding-bottom: 20px; border-bottom-style: solid; border-bottom-color: rgba(128, 128, 128, 0.19); border-bottom-width: 1px;">
              <i class="fa fa-shopping-cart fa-2x" style="margin-right: 1%" aria-hidden="true"></i>
              <span class="info titleCard">DETALLE DE ARTÍCULOS</span>
            </div>

            <div class="col-md-2 mg-bottom25 text-right"
                 style="padding-bottom: 20px; border-bottom-style: solid; border-bottom-color: rgba(128, 128, 128, 0.19); border-bottom-width: 1px;">
              <a data-toggle="modal" data-target="#modal-add-new-article" type="button"
                 class="back btn btn-primary button width-100"
                 style="background: #FFFFFF; color: #083f56 !important; border-color: #083f56 !important; font-family:RobotoDraftMedium; margin-top: -5px;">
                AGREGAR ARTÍCULO
              </a>
            </div>

            <div class="table-responsive table table-hover dataTable no-footer info"
                 style="font-size: 13px; font-family: Lato-Regular; padding-left: 2%; padding-right: 2%;">
              <table id="tbl-purchase-lines" class="table table-style table-hover dataTable">
                <thead>
                <tr>
                  <th>Id</th>
                  <th>VariacionId</th>
                  <th>Codigo</th>
                  <th>Nombre</th>
                  <th>Variación</th>
                  <th class="text-center">Precio Unitario</th>
                  <th class="text-center">Cantidad</th>
                  <th class="text-center">Total</th>
                  <th></th>
                </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
            </div>
          </div>

        %{-- CUSTOMER INFO SECTION --}%

          <div class="row spacing-big wrapper-column" style="padding-left: 0px; padding-right: 0px;">
            <div class="col-md-12"
                 style="padding-bottom: 20px; border-bottom-style: solid; border-bottom-color: rgba(128, 128, 128, 0.19); border-bottom-width: 1px;">
              <i class="fa fa-user fa-2x" style="margin-right: 1%" aria-hidden="true"></i>
              <span class="info titleCard">DATOS DEL COMPRADOR</span>
            </div>

            <div class="row" style="padding-right: 2%; padding-left: 2%;">
              <div class="col-md-2" style="margin-top: 40px;">
                <span class="info simple">Nombre:</span>
              </div>

              <div class="col-md-4 mg-top25">
                <input type="text" class="form-control" id="txt-customer-first-name" name="customerFirstName"/>
              </div>

              <div class="col-md-2" style="margin-top: 40px;">
                <span class="info simple mg-left10">Apellido:</span>
              </div>

              <div class="col-md-4 mg-top25">
                <input type="text" class="form-control" id="txt-customer-last-name" name="customerLastName"/>
              </div>
            </div>

            <div class="row" style="padding-right: 2%; padding-left: 2%;">
              <div class="col-md-2 mg-top20">
                <span class="info simple">Nacionalidad</span>
              </div>

              <div class="col-md-2" style="margin-top: 5px;">
                <select class="form-control" id="cmb-customer-doc-country" name="customerDocCountry">
                  <option value="UY">Uruguay</option>
                  <option value="OTRO">OTRO</option>
                </select>
              </div>
              <div class="col-md-2 mg-top20">
                <span class="info simple">Tipo de documento:</span>
              </div>

              <div class="col-md-2" style="margin-top: 5px;">
                <select class="form-control" id="cmb-customer-doc-type" name="customerDocType">
                  <option value="CI">CI</option>
                  <option value="RUT">RUT</option>
                  <option value="Pasaporte">PASAPORTE</option>
                  <option value="OTRO">OTRO</option>
                </select>
              </div>


              <div class="col-md-2 mg-top20">
                <span class="info simple mg-left10">Número de documento:</span>
              </div>

              <div class="col-md-2" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-customer-doc-number" name="customerDocNumber"/>
              </div>
            </div>

            <div class="row" style="padding-right: 2%; padding-left: 2%;">
              <div class="col-md-2 mg-top20">
                <span class="info simple">Número de contacto:</span>
              </div>

              <div class="col-md-4" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-customer-phone" name="customerPhone"/>
              </div>

              <div class="col-md-2 mg-top20">
                <span class="info simple mg-left10">Correo electrónico:</span>
              </div>

              <div class="col-md-4" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-customer-email" name="customerEmail"/>
              </div>
            </div>
            <div class="row" style="padding-right: 2%; padding-left: 2%;">
              <div class="col-md-2 mg-top20">
                <span class="info simple">Calle:</span>
              </div>

              <div class="col-md-4" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-customer-street_name" name="customerStreetName"/>
              </div>

              <div class="col-md-2 mg-top20">
                <span class="info simple mg-left10">Número de puerta:</span>
              </div>

              <div class="col-md-4" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-customer-street_number" name="customerSreetNumber"/>
              </div>
            </div>

            <div class="row" style="padding-right: 2%; padding-left: 2%;">
              <div class="col-md-2 mg-top20">
                <span class="info simple">Ciudad:</span>
              </div>

              <div class="col-md-2" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-customer-city" name="customerCity"/>
              </div>

              <div class="col-md-2 mg-top20">
                <span class="info simple mg-left10">Departamento/estado:</span>
              </div>

              <div class="col-md-2" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-customer-state" name="customerState"/>
              </div>
              <div class="col-md-2 mg-top20">
                <span class="info simple mg-left10">País:</span>
              </div>

              <div class="col-md-2" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-customer-country" name="customerCountry"/>
              </div>
            </div>
          </div>

        %{-- SHIPPING INFO SECTION --}%

          <div id="shipping-info-section" class="row spacing-big wrapper-column collapse" style="padding-left: 0px; padding-right: 0px;">
            <div class="col-md-12" style="padding-bottom: 20px; border-bottom-style: solid; border-bottom-color: rgba(128, 128, 128, 0.19); border-bottom-width: 1px;">
              <i class="fa fa-truck fa-2x" style="margin-right: 1%" aria-hidden="true"></i>
              <span class="info titleCard">DETALLE DEL ENVÍO</span>
            </div>

            <div class="row" style="padding-right: 2%; padding-left: 2%;">
              <div class="col-md-1" style="margin-top: 40px;">
                <span class="info simple">Estado:</span>
              </div>
              <div class="col-md-2 mg-top25">
                <select class="form-control" id="cmb-shipping-status" name="shippingStatus">
                  <g:each in="${shippingStatuses}">
                    <option value="${it.id}">${it.name}</option>
                  </g:each>
                </select>
              </div>
              <div class="col-md-1 padding-right0" style="margin-top: 40px;">
                <span id="lbl-shipping-cost" class="info simple mg-left10">Costo:</span>
              </div>
              <div class="col-md-2 mg-top25">
                <input type="text" class="form-control" id="txt-shipping-cost" name="shippingCost" value="0"/>
              </div>
            </div>

            <div class="row" style="padding-right: 2%; padding-left: 2%;">
              <div class="col-md-1 mg-top20">
                <span class="info simple">Destinatario:</span>
              </div>
              <div class="col-md-5" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-shipping-receiver-name" name="shippingReceiverName"/>
              </div>
              <div class="col-md-1 mg-top20">
                <span class="info simple mg-left10">Teléfono:</span>
              </div>
              <div class="col-md-5" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-shipping-receiver-phone" name="shippingReceiverPhone"/>
              </div>
            </div>

            <div class="row" style="padding-right: 2%; padding-left: 2%;">
              <div class="col-md-1 mg-top20">
                <span class="info simple">Calle:</span>
              </div>
              <div class="col-md-2" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-shipping-street-name" name="shippingStreetName"/>
              </div>
              <div class="col-md-1 mg-top20">
                <span class="info simple mg-left10">Número:</span>
              </div>
              <div class="col-md-2" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-shipping-street-number" name="shippingStreetNumber"/>
              </div>
              <div class="col-md-1 mg-top20" >
                <span class="info simple mg-left10">Barrio:</span>
              </div>
              <div class="col-md-2" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-shipping-neighborhood" name="shippingNeighborhood"/>
              </div>
              <div class="col-md-1 mg-top20 padding-right0">
                <span class="info simple mg-left10">Municipalidad:</span>
              </div>
              <div class="col-md-2" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-shipping-municipality" name="shippingMunicipality"/>
              </div>
            </div>

            <div class="row" style="padding-right: 2%; padding-left: 2%;">
              <div class="col-md-1 mg-top20 padding-right0">
                <span class="info simple">Cod. Postal:</span>
              </div>
              <div class="col-md-2" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-shipping-zip-code" name="shippingZipCode"/>
              </div>
              <div class="col-md-1 mg-top20">
                <span class="info simple mg-left10">Ciudad:</span>
              </div>
              <div class="col-md-2" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-shipping-city" name="shippingCity"/>
              </div>
              <div class="col-md-1 mg-top20" >
                <span class="info simple mg-left10">Provincia:</span>
              </div>
              <div class="col-md-2" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-shipping-state" name="shippingState"/>
              </div>
              <div class="col-md-1 mg-top20" >
                <span class="info simple mg-left10">País:</span>
              </div>
              <div class="col-md-2" style="margin-top: 5px;">
                <input type="text" class="form-control" id="txt-shipping-country" name="shippingCountry"/>
              </div>
            </div>

            <div class="row" style="padding-right: 2%; padding-left: 2%;">
              <div class="col-md-2 mg-top20">
                <span class="info simple">Comentarios del envío:</span>
              </div>

              <div class="col-md-10" style="margin-top: 5px;">
                <textarea class="form-control" name="shippingComments"></textarea>
              </div>
            </div>



          </div>

        </g:form>
      </div>
    </div>
  </div>
<script type="text/javascript">
$(document).ready(function(){
  $(".ci").keyup(function(){
        $(".ci").validate_ci();
  });
});
</script>
</body>
