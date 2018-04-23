<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxGridView ID="gridView" runat="server" AutoGenerateColumns="False" DataSourceID="ads"
            KeyFieldName="ProductID" ClientInstanceName="gridView" OnCustomCallback="gridView_CustomCallback">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Name="ProdNameBand">
                    <HeaderCaptionTemplate>
                        Some Information
                        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="collapse.png">
                            <ClientSideEvents Click="function(s, e){ gridView.PerformCallback('collapse|ProdName'); }" />
                        </dx:ASPxImage>
                    </HeaderCaptionTemplate>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>

                <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1" Visible="false" Name="ProdName">
                    <Settings AllowSort="False" />
                    <HeaderCaptionTemplate>
                        Product Name
                        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="expand.png">
                            <ClientSideEvents Click="function(s, e){ gridView.PerformCallback('expand|ProdName'); }" />
                        </dx:ASPxImage>
                    </HeaderCaptionTemplate>
                </dx:GridViewDataTextColumn>

                <dx:GridViewBandColumn Name="ProdPriceBand" VisibleIndex="5">
                    <HeaderCaptionTemplate>
                        Additional Information
                        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="collapse.png">
                            <ClientSideEvents Click="function(s, e){ gridView.PerformCallback('collapse|ProdPrice'); }" />
                        </dx:ASPxImage>
                    </HeaderCaptionTemplate>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ReorderLevel" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="9">
                        </dx:GridViewDataCheckColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="5" Visible="false" Name="ProdPrice">
                      <Settings AllowSort="False" />
                    <HeaderCaptionTemplate>
                        Unit Price
                        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="expand.png">
                            <ClientSideEvents Click="function(s, e){ gridView.PerformCallback('expand|ProdPrice'); }" />
                        </dx:ASPxImage>
                    </HeaderCaptionTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT * FROM [Products]"></asp:AccessDataSource>
    </form>
</body>
</html>