<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="etherscan._Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section id="main-content">
        <section id="wrapper">
            <div class="row">
                <div class="col-xs-6 col-md-6">
                    Save / Update Token
                    <form>
                        <div class="form-group row">
                            <label for="Name" class="col-sm-3 col-form-label">Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputName" placeholder="Name">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="Symbol" class="col-sm-3 col-form-label">Symbol</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputSymbol" placeholder="Symbol">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="Contact Address" class="col-sm-3 col-form-label">Contact Address</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputContactAddress" placeholder="Contact Address">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="Total Supply" class="col-sm-3 col-form-label">Total Supply</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputTotalSupply" placeholder="Total Supply">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="Total Holders" class="col-sm-3 col-form-label">Total Holders</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputTotalHolders" placeholder="Total Holders">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="Button" class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                                <button type="button" class="btn btn-primary">Save</button>
                                <button type="reset" class="btn btn-secondary">Reset</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-xs-6 col-md-6">
                    Token Statistics by Total Supply<br />
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="TableQuery">
                        <series>
                            <asp:Series ChartType="Doughnut" Name="Series1" XValueMember="name" YValueMembers="total_supply">
                            </asp:Series>
                        </series>
                        <chartareas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </chartareas>
                    </asp:Chart>
&nbsp;<div id="canvas-holder">
                        <canvas id="chart-area"></canvas>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-xs-12 col-md-12">
                    Table
                <br />
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="TableQuery">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="Rank" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="symbol" HeaderText="Symbol" SortExpression="symbol" />
                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                            <asp:BoundField DataField="contract_address" HeaderText="Contact Address" SortExpression="contract_address" />
                            <asp:BoundField DataField="total_holders" HeaderText="Total Holders" SortExpression="total_holders" />
                            <asp:BoundField DataField="total_supply" HeaderText="Total Supply" SortExpression="total_supply" />
                            <asp:BoundField DataField="Overall" HeaderText="Total Supply %" ReadOnly="True" SortExpression="Overall" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="TableQuery" runat="server" ConnectionString="<%$ ConnectionStrings:etherscanConnectionString %>" SelectCommand="SELECT [id], [symbol], [name],[contract_address],[total_holders], [total_supply], 
FORMAT((total_supply/(SELECT CAST(SUM(total_supply) as decimal(38,4)) FROM [Token])),'P4') as [Overall] from token"></asp:SqlDataSource>
                </div>
            </div>
        </section>
    </section>

</asp:Content>
