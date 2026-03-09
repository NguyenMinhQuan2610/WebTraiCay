<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeBehind="Shop.aspx.cs" Inherits="WebTraiCay.Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="text-center mb-5">
            <h2 class="font-weight-bold text-success text-uppercase">Cửa Hàng Trái Cây</h2>
            <p class="text-muted">Khám phá các loại trái cây tươi ngon theo danh mục</p>

            <asp:SqlDataSource ID="dsCategories" runat="server"
                ConnectionString="<%$ ConnectionStrings:FruitShopDB %>"
                SelectCommand="SELECT * FROM Categories"></asp:SqlDataSource>
            <div class="row justify-content-center mb-4">
                <div class="col-md-6">
                    <div class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Tìm trái cây..." />
                        <div class="input-group-append">
                            <asp:Button ID="btnSearch" runat="server" Text="Tìm" CssClass="btn btn-success" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="category-filter d-flex justify-content-center mt-4 flex-wrap">
                <a href="Shop.aspx?cat=0" class="filter-item border shadow-sm">Tất cả</a>

                <asp:Repeater ID="rptCategories" runat="server" DataSourceID="dsCategories">
                    <ItemTemplate>
                        <a href='Shop.aspx?cat=<%# Eval("CategoryID") %>' class="filter-item border shadow-sm">
                            <%# Eval("CategoryName") %>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <asp:SqlDataSource ID="dsProducts" runat="server"
            ConnectionString="<%$ ConnectionStrings:FruitShopDB %>"
            SelectCommand="SELECT * FROM Fruits WHERE (CategoryID=@cat OR @cat=0) AND (@search='' OR FruitName LIKE '%' + @search + '%') ORDER BY FruitID DESC"
            CancelSelectOnNullParameter="false">
            <SelectParameters>
                <asp:QueryStringParameter Name="cat" QueryStringField="cat" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter Name="search" ControlID="txtSearch" PropertyName="Text" DefaultValue="" ConvertEmptyStringToNull="false" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div class="row">
            <asp:ListView ID="lvProducts" runat="server" DataSourceID="dsProducts">

                <LayoutTemplate>
                    <div class="row g-4">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                    </div>
                    <div class="pagination-box">

                        <asp:DataPager ID="DataPager1" runat="server" PageSize="6" PagedControlID="lvProducts">
                            <Fields>
                                <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowNextPageButton="false" ShowLastPageButton="false" FirstPageText="First" PreviousPageText="<"
                                    ButtonCssClass="page-btn" />
                                <asp:NumericPagerField 
                                    ButtonCount="5"
                                    NumericButtonCssClass="page-btn"
                                    CurrentPageLabelCssClass="page-btn active" />
                                <asp:NextPreviousPagerField
                                    ShowFirstPageButton="false"
                                    ShowPreviousPageButton="false"
                                    ShowNextPageButton="true"
                                    ShowLastPageButton="true"
                                    NextPageText=">"
                                    LastPageText="Last"
                                    ButtonCssClass="page-btn" />
                            </Fields>

                        </asp:DataPager>

                    </div>

                </LayoutTemplate>

                <ItemTemplate>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card h-100 border-0 shadow-sm">

                            <div class="product-img-box">
                                <img class="product-img" src='<%# Eval("ImagePath") %>' />
                            </div>

                            <div class="card-body text-center">
                                <h5><%# Eval("FruitName") %></h5>
                                <p class="text-danger"><%# Eval("Price","{0:N0}") %> đ</p>

                                <a href='ProductDetails.aspx?id=<%# Eval("FruitID") %>'
                                    class="btn btn-success btn-sm mt-2">Xem chi tiết
                                </a>
                            </div>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
            <div class="text-center mt-4">
            </div>
        </div>
    </div>

    <style>
        .pagination-box {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 8px;
            margin-top: 40px;
        }

        .page-btn {
            display: inline-block;
            padding: 8px 14px;
            border-radius: 8px;
            border: 1px solid #28a745;
            color: #28a745;
            text-decoration: none;
            font-weight: 600;
            background: #fff;
            transition: 0.2s;
        }

            .page-btn:hover {
                background: #28a745;
                color: #fff;
            }

            .page-btn.active {
                background: #28a745;
                color: #fff;
            }

        .category-filter {
            gap: 12px;
        }

        .filter-item {
            padding: 12px 28px;
            border-radius: 50px;
            background: #ffffff;
            color: #28a745;
            font-weight: 700;
            font-size: 0.9rem;
            text-decoration: none !important;
            border: 1px solid #e9ecef !important;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

            .filter-item:hover {
                background: #28a745;
                color: #ffffff !important;
                transform: translateY(-3px);
                box-shadow: 0 8px 20px rgba(40, 167, 69, 0.2) !important;
                border-color: #28a745 !important;
            }

        .product-img-box {
            height: 220px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 15px;
            background: #fff;
            border-radius: 20px 20px 0 0;
        }

        .product-img {
            max-height: 100%;
            max-width: 100%;
            object-fit: contain;
        }
    </style>
</asp:Content>
