<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeBehind="ProductDetails.aspx.cs" Inherits="WebTraiCay.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="dsDetail" runat="server"
        ConnectionString="<%$ ConnectionStrings:FruitShopDB %>"
        SelectCommand="SELECT * FROM Fruits WHERE FruitID=@id">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="container mt-5">
        <asp:FormView ID="fvProduct" runat="server" DataSourceID="dsDetail" Width="100%">
            <ItemTemplate>
                <div class="card shadow-lg border-0 rounded-lg overflow-hidden">
                    <div class="row no-gutters">
                        <div class="col-md-6 bg-light d-flex align-items-center justify-content-center p-5">
                            <img src='<%# Eval("ImagePath") %>' class="img-fluid rounded shadow-sm"
                                style="max-height: 450px; transition: transform 0.3s ease;"
                                onmouseover="this.style.transform='scale(1.05)'"
                                onmouseout="this.style.transform='scale(1)'" />
                        </div>

                        <div class="col-md-6 p-5 d-flex flex-column justify-content-center">
                            <nav aria-label="breadcrumb" class="mb-3">
                                <ol class="breadcrumb bg-transparent p-0 small">
                                    <li class="breadcrumb-item"><a href="Default.aspx" class="text-success">Trang chủ</a></li>
                                    <li class="breadcrumb-item"><a href="Shop.aspx" class="text-success">Cửa hàng</a></li>
                                    <li class="breadcrumb-item active text-muted font-weight-bold"><%# Eval("FruitName") %></li>
                                </ol>
                            </nav>

                            <h1 class="display-4 font-weight-bold text-dark mb-3"><%# Eval("FruitName") %></h1>

                            <div class="mb-4">
                                <span class="text-danger font-weight-bold display-4">
                                    <%# Eval("Price", "{0:N0}") %> <small>đ</small>
                                </span>
                                <span class='badge ml-3 px-3 py-2 <%# Convert.ToInt32(Eval("StockQuantity")) > 0 ? "badge-success" : "badge-danger" %>'>
                                    <%# Convert.ToInt32(Eval("StockQuantity")) > 0 ? "Còn hàng" : "Hết hàng" %>
                                </span>
                            </div>

                            <hr class="my-4" />

                            <h5 class="text-uppercase font-weight-bold text-muted small mb-3">Mô tả sản phẩm</h5>
                            <p class="text-secondary leading-relaxed mb-5" style="font-size: 1.1rem;">
                                <%# Eval("Description") %>
                            </p>

                            <div class="d-flex align-items-center">
                                <asp:Button ID="btnAdd" runat="server"
                                    CssClass="btn btn-success btn-lg px-5 py-3 shadow font-weight-bold flex-grow-1"
                                    Text="GIỎ HÀNG +" OnClick="btnAdd_Click" />
                            </div>

                            <p class="mt-4 small text-muted text-center">
                                <i class="fa fa-truck mr-2"></i>Miễn phí vận chuyển cho đơn hàng trên 500k
                            </p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:FormView>
    </div>

    <style>
        .breadcrumb-item + .breadcrumb-item::before {
            content: ">";
        }

        .leading-relaxed {
            line-height: 1.8;
        }

        .display-4 {
            font-size: 2.5rem;
        }

        @media (max-width: 768px) {
            .display-4 {
                font-size: 2rem;
            }

            .p-5 {
                padding: 2rem !important;
            }
        }
    </style>

</asp:Content>
