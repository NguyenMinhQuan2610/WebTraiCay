<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeBehind="Default.aspx.cs" Inherits="WebTraiCay.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="bg-light py-5 mb-5 shadow-sm">
        <div class="container text-center">
            <h1 class="display-4 font-weight-bold text-success">Trái Cây Tươi Mỗi Ngày</h1>
            <p class="lead text-muted">Sức khỏe cho gia đình bạn từ những sản phẩm tự nhiên nhất.</p>
            <a href="Shop.aspx" class="btn btn-success btn-lg px-4 mt-3 shadow">Mua sắm ngay</a>
        </div>
    </div>

    <div class="container">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h3 class="font-weight-bold mb-0">Sản phẩm mới nhất</h3>
            <a href="Shop.aspx" class="text-success font-weight-bold">Xem tất cả &rarr;</a>
        </div>

        <asp:SqlDataSource ID="dsAllProducts" runat="server"
            ConnectionString="<%$ ConnectionStrings:FruitShopDB %>"
            SelectCommand="SELECT TOP 6 * FROM Fruits ORDER BY FruitID DESC">
        </asp:SqlDataSource>

        <div class="row">
            <asp:Repeater ID="rptAll" runat="server" DataSourceID="dsAllProducts">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card h-100 border-0 shadow-sm transition-hover">
                            
                            <div class="product-img-container">
                                <img class="card-img-top-fixed" src='<%# Eval("ImagePath") %>' alt="Fruit Image">
                            </div>
                            
                            <div class="card-body text-center p-4 d-flex flex-column">
                                <h5 class="card-title font-weight-bold text-dark mb-2">
                                    <%# Eval("FruitName") %>
                                </h5>
                                
                                <p class="text-danger font-weight-bold h5 mb-3 mt-auto">
                                    <%# Eval("Price", "{0:N0}") %> đ
                                </p>
                                
                                <a class="btn btn-info btn-block py-2 shadow-sm font-weight-bold mt-2" 
                                   href="ProductDetails.aspx?id=<%# Eval("FruitID") %>">
                                   Chi tiết sản phẩm
                                </a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <style>
        .product-img-container {
            height: 220px; 
            overflow: hidden;
            background-color: #f8f9fa;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card-img-top-fixed {
            width: 100%;
            height: 100%;
            object-fit: cover; 
            transition: transform 0.5s ease;
            padding: 10px;
        }

        .transition-hover:hover {
            transform: translateY(-8px);
            transition: all 0.3s ease;
            box-shadow: 0 15px 30px rgba(0,0,0,0.12) !important;
        }

        .transition-hover:hover .card-img-top-fixed {
            transform: scale(1.08); 
        }

        .card-title {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            height: 3rem; 
        }
    </style>

</asp:Content>