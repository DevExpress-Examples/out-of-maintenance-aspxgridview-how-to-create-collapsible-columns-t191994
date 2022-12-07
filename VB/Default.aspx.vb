Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
        If Session("ProdNameExpanded") IsNot Nothing Then
            Dim isExpanded As Boolean = DirectCast(Session("ProdNameExpanded"), Boolean)
            gridView.Columns("ProdNameBand").Visible = isExpanded
            gridView.Columns("ProdName").Visible = Not isExpanded
        End If
        If Session("ProdPriceExpanded") IsNot Nothing Then
            Dim isExpanded As Boolean = DirectCast(Session("ProdPriceExpanded"), Boolean)
            gridView.Columns("ProdPriceBand").Visible = isExpanded
            gridView.Columns("ProdPrice").Visible = Not isExpanded
        End If
    End Sub
    Protected Sub gridView_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs)
        Dim param() As String = e.Parameters.Split("|"c)
        Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)

        Dim colName As String = param(1)
        If param(0) = "collapse" Then
            grid.Columns(colName & "Band").Visible = False
            grid.Columns(colName).Visible = True
            Session(colName & "Expanded") = False
        ElseIf param(0) = "expand" Then
            grid.Columns(colName & "Band").Visible = True
            grid.Columns(colName).Visible = False
            Session(colName & "Expanded") = True
        End If
    End Sub


End Class