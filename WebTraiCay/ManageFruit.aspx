<%@ Page Title="Quản lý Trái Cây" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ManageFruit.aspx.cs" Inherits="WebTraiCay.ManageFruit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap');

        :root {
            --green-deep: #1a5c38;
            --green-mid: #2d8653;
            --green-light: #4caf74;
            --green-pale: #e8f5ee;
            --amber: #f5a623;
            --amber-pale: #fff8ed;
            --cream: #faf8f3;
            --ink: #1c2b22;
            --muted: #6b7f72;
            --border: #d8e8dd;
            --red-soft: #ff6b6b;
            --shadow-green: 0 4px 24px rgba(45,134,83,0.13);
            --shadow-card: 0 2px 16px rgba(28,43,34,0.09);
            --radius: 16px;
            --radius-sm: 10px;
        }

        .mf-page {
            background: var(--cream);
            font-family: 'DM Sans', sans-serif;
            min-height: 100vh;
            padding: 2.5rem 0 4rem;
        }

        .mf-page-header {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 2.5rem;
        }

            .mf-page-header .title-group h2 {
                font-family: 'Playfair Display', serif;
                font-size: 2rem;
                color: var(--green-deep);
                margin: 0 0 .25rem;
                line-height: 1.2;
            }

            .mf-page-header .title-group p {
                color: var(--muted);
                font-size: .9rem;
                margin: 0;
                font-weight: 400;
            }

        .mf-icon-leaf {
            width: 48px;
            height: 48px;
            background: linear-gradient(135deg, var(--green-mid), var(--green-light));
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            box-shadow: var(--shadow-green);
            flex-shrink: 0;
        }

        .mf-header-left {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .mf-message {
            background: linear-gradient(135deg, var(--amber), #f7c25e);
            color: #7a4a00;
            font-weight: 600;
            font-size: .82rem;
            padding: .5rem 1.1rem;
            border-radius: 50px;
            box-shadow: 0 3px 12px rgba(245,166,35,.3);
            letter-spacing: .3px;
            align-self: center;
        }

            .mf-message:empty {
                display: none;
            }

        .mf-section-label {
            display: flex;
            align-items: center;
            gap: .7rem;
            margin-bottom: 1.25rem;
        }

            .mf-section-label .dot {
                width: 10px;
                height: 10px;
                background: var(--green-mid);
                border-radius: 50%;
                box-shadow: 0 0 0 4px rgba(45,134,83,.15);
            }

            .mf-section-label span {
                font-family: 'DM Sans', sans-serif;
                font-weight: 600;
                font-size: 1rem;
                color: var(--green-deep);
                letter-spacing: .3px;
                text-transform: uppercase;
            }

            .mf-section-label small {
                color: var(--muted);
                font-size: .78rem;
                font-weight: 400;
                margin-left: .3rem;
                text-transform: none;
                letter-spacing: 0;
            }

        .mf-table-card {
            background: #fff;
            border-radius: var(--radius);
            box-shadow: var(--shadow-card);
            border: 1px solid var(--border);
            overflow: hidden;
            margin-bottom: 3rem;
        }

            .mf-table-card .card-top-bar {
                background: linear-gradient(90deg, var(--green-deep) 0%, var(--green-mid) 100%);
                padding: 1rem 1.5rem;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

                .mf-table-card .card-top-bar span {
                    color: rgba(255,255,255,.75);
                    font-size: .82rem;
                    font-weight: 500;
                }

                .mf-table-card .card-top-bar .bar-title {
                    color: #fff;
                    font-weight: 600;
                    font-size: 1rem;
                    letter-spacing: .2px;
                }

            .mf-table-card .table-responsive {
                overflow-x: auto;
            }

            .mf-table-card table.table {
                margin-bottom: 0;
                border-collapse: separate;
                border-spacing: 0;
                width: 100%;
            }

                .mf-table-card table.table thead tr th {
                    background: var(--green-pale);
                    color: var(--green-deep);
                    font-size: .75rem;
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: .8px;
                    padding: .9rem 1.2rem;
                    border: none;
                    border-bottom: 2px solid var(--border);
                    white-space: nowrap;
                }

                .mf-table-card table.table tbody tr td {
                    padding: .85rem 1.2rem;
                    border-top: 1px solid #f0f4f1;
                    color: var(--ink);
                    font-size: .9rem;
                    font-weight: 400;
                    vertical-align: middle;
                }

                .mf-table-card table.table tbody tr:hover td {
                    background: #f7fbf8;
                }

                .mf-table-card table.table tbody tr td img {
                    width: 52px;
                    height: 52px;
                    border-radius: 10px;
                    object-fit: cover;
                    border: 2px solid var(--border);
                    box-shadow: 0 2px 8px rgba(0,0,0,.08);
                }

            .mf-table-card table a[href*="Edit"],
            .mf-table-card table a[href*="Update"],
            .mf-table-card table a[href*="Cancel"] {
                display: inline-flex;
                align-items: center;
                gap: .3rem;
                font-size: .78rem;
                font-weight: 600;
                padding: .35rem .8rem;
                border-radius: 6px;
                text-decoration: none !important;
                transition: all .18s;
                letter-spacing: .2px;
            }

            .mf-table-card table a[href*="Edit"] {
                background: var(--green-pale);
                color: var(--green-deep);
                border: 1px solid #b8dfc6;
            }

                .mf-table-card table a[href*="Edit"]:hover {
                    background: var(--green-mid);
                    color: #fff;
                }

            .mf-table-card table a[href*="Update"] {
                background: linear-gradient(135deg, var(--green-mid), var(--green-light));
                color: #fff;
                border: none;
                box-shadow: 0 2px 8px rgba(45,134,83,.25);
            }

                .mf-table-card table a[href*="Update"]:hover {
                    background: linear-gradient(135deg, var(--green-deep), var(--green-mid));
                    color: #fff;
                    transform: translateY(-1px);
                }

            .mf-table-card table a[href*="Cancel"] {
                background: #fff0f0;
                color: var(--red-soft);
                border: 1px solid #ffd0d0;
                margin-left: .4rem;
            }

                .mf-table-card table a[href*="Cancel"]:hover {
                    background: var(--red-soft);
                    color: #fff;
                }

            .mf-table-card table input.form-control,
            .mf-table-card table select.form-control,
            .mf-table-card table textarea.form-control {
                font-size: .85rem;
                padding: .4rem .7rem;
                border-radius: 8px;
                border: 1.5px solid var(--border);
                background: #fafffe;
                color: var(--ink);
                transition: border .2s, box-shadow .2s;
                min-width: 110px;
            }

                .mf-table-card table input.form-control:focus {
                    border-color: var(--green-mid);
                    box-shadow: 0 0 0 3px rgba(45,134,83,.12);
                    outline: none;
                }

        .mf-form-card {
            background: #fff;
            border-radius: var(--radius);
            box-shadow: var(--shadow-card);
            border: 1px solid var(--border);
            overflow: hidden;
        }

            .mf-form-card .form-header {
                background: linear-gradient(135deg, var(--green-deep) 0%, var(--green-mid) 60%, var(--green-light) 100%);
                padding: 1.6rem 2rem;
                position: relative;
                overflow: hidden;
            }

                .mf-form-card .form-header::before {
                    content: '🍊🍇🍓🍋🍍';
                    position: absolute;
                    right: 1.5rem;
                    top: 50%;
                    transform: translateY(-50%);
                    font-size: 1.6rem;
                    opacity: .25;
                    letter-spacing: .5rem;
                }

                .mf-form-card .form-header h4 {
                    color: #fff;
                    font-family: 'Playfair Display', serif;
                    font-size: 1.4rem;
                    margin: 0 0 .2rem;
                }

                .mf-form-card .form-header p {
                    color: rgba(255,255,255,.7);
                    font-size: .83rem;
                    margin: 0;
                    font-weight: 400;
                }

            .mf-form-card .form-body {
                padding: 2rem;
            }

        .mf-field {
            margin-bottom: 1.4rem;
        }

        .mf-label {
            display: block;
            font-size: .8rem;
            font-weight: 600;
            color: var(--green-deep);
            text-transform: uppercase;
            letter-spacing: .5px;
            margin-bottom: .45rem;
        }

            .mf-label i {
                color: var(--green-mid);
                margin-right: .3rem;
            }

        .mf-form-card input.form-control,
        .mf-form-card select.form-control,
        .mf-form-card textarea.form-control {
            border: 1.5px solid var(--border);
            border-radius: var(--radius-sm);
            padding: .7rem 1rem;
            font-size: .9rem;
            font-family: 'DM Sans', sans-serif;
            color: var(--ink);
            background: #fafdfa;
            transition: border .2s, box-shadow .2s, background .2s;
            width: 100%;
            box-sizing: border-box;
        }

            .mf-form-card input.form-control:focus,
            .mf-form-card select.form-control:focus,
            .mf-form-card textarea.form-control:focus {
                border-color: var(--green-mid);
                box-shadow: 0 0 0 3px rgba(45,134,83,.12);
                background: #fff;
                outline: none;
            }

        .mf-form-card select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%232d8653' stroke-width='1.8' fill='none' stroke-linecap='round'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            padding-right: 2.5rem;
        }

        .mf-upload-zone {
            border: 2px dashed var(--border);
            border-radius: var(--radius-sm);
            padding: 1.2rem 1rem;
            background: var(--green-pale);
            text-align: center;
            transition: border-color .2s, background .2s;
            position: relative;
            cursor: pointer;
        }

            .mf-upload-zone:hover {
                border-color: var(--green-mid);
                background: #dff1e6;
            }

            .mf-upload-zone .upload-icon {
                font-size: 1.8rem;
                margin-bottom: .4rem;
            }

            .mf-upload-zone .upload-hint {
                font-size: .8rem;
                color: var(--muted);
                display: block;
                margin-top: .25rem;
            }

            .mf-upload-zone input[type=file] {
                position: absolute;
                inset: 0;
                opacity: 0;
                cursor: pointer;
                width: 100%;
                height: 100%;
            }

        .mf-row {
            display: flex;
            gap: 1.25rem;
            flex-wrap: wrap;
        }

            .mf-row .mf-field {
                flex: 1 1 220px;
            }

        .mf-btn-submit {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: .6rem;
            width: 100%;
            padding: .9rem;
            background: linear-gradient(135deg, var(--green-deep) 0%, var(--green-mid) 60%, var(--green-light) 100%);
            color: #fff;
            font-family: 'DM Sans', sans-serif;
            font-size: 1rem;
            font-weight: 700;
            letter-spacing: .6px;
            border: none;
            border-radius: var(--radius-sm);
            box-shadow: 0 4px 20px rgba(45,134,83,.35);
            cursor: pointer;
            transition: transform .18s, box-shadow .18s;
            text-transform: uppercase;
            margin-top: .5rem;
        }

            .mf-btn-submit:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 28px rgba(45,134,83,.45);
            }

            .mf-btn-submit:active {
                transform: translateY(0);
            }

        .mf-stats-row {
            display: flex;
            gap: 1rem;
            margin-bottom: 2.5rem;
            flex-wrap: wrap;
        }

        .mf-stat-pill {
            background: #fff;
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: .8rem 1.3rem;
            display: flex;
            align-items: center;
            gap: .8rem;
            box-shadow: var(--shadow-card);
            flex: 1 1 160px;
        }

            .mf-stat-pill .s-icon {
                width: 38px;
                height: 38px;
                border-radius: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.2rem;
                flex-shrink: 0;
            }

                .mf-stat-pill .s-icon.green {
                    background: var(--green-pale);
                }

                .mf-stat-pill .s-icon.amber {
                    background: var(--amber-pale);
                }

            .mf-stat-pill .s-text {
                line-height: 1.3;
            }

                .mf-stat-pill .s-text strong {
                    display: block;
                    font-size: 1.1rem;
                    color: var(--ink);
                    font-weight: 700;
                }

                .mf-stat-pill .s-text span {
                    font-size: .75rem;
                    color: var(--muted);
                    font-weight: 400;
                }

        .mf-empty {
            padding: 3.5rem 1rem;
            text-align: center;
            color: var(--muted);
        }

            .mf-empty .empty-icon {
                font-size: 3rem;
                margin-bottom: .8rem;
            }

            .mf-empty p {
                font-size: .9rem;
                margin: 0;
            }

        .mf-divider {
            border: none;
            border-top: 1px solid var(--border);
            margin: 2rem 0 2.5rem;
        }

        @media(max-width: 768px) {
            .mf-page-header {
                flex-direction: column;
            }

            .mf-form-card .form-body {
                padding: 1.25rem;
            }

            .mf-stats-row {
                gap: .6rem;
            }

            .mf-stat-pill {
                flex: 1 1 130px;
            }
        }

        @keyframes fadeSlideUp {
            from {
                opacity: 0;
                transform: translateY(18px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .mf-anim-1 {
            animation: fadeSlideUp .45s ease both;
        }

        .mf-anim-2 {
            animation: fadeSlideUp .45s .1s ease both;
        }

        .mf-anim-3 {
            animation: fadeSlideUp .45s .2s ease both;
        }

        .mf-anim-4 {
            animation: fadeSlideUp .45s .3s ease both;
        }
    </style>

    <div class="mf-page">
        <div class="container">

            <div class="mf-page-header mf-anim-1">
                <div class="mf-header-left">
                    <div class="mf-icon-leaf">🌿</div>
                    <div class="title-group">
                        <h2>Quản lý Trái Cây</h2>
                        <p>Thêm, chỉnh sửa và quản lý toàn bộ sản phẩm trong cửa hàng</p>
                    </div>
                </div>
                <asp:Label ID="lblMessage" runat="server" CssClass="mf-message"></asp:Label>
            </div>

            <div class="mf-stats-row mf-anim-2">
                <div class="mf-stat-pill">
                    <div class="s-icon green">🍎</div>
                    <div class="s-text">
                        <strong>
                            <asp:Label ID="lblTotalProducts" runat="server"></asp:Label></strong>
                        <span>Tổng sản phẩm</span>
                    </div>
                </div>
                <div class="mf-stat-pill">
                    <div class="s-icon green">✅</div>
                    <div class="s-text">
                        <strong>
                            <asp:Label ID="lblStatus" runat="server"></asp:Label></strong>
                        <span>Trạng thái kho</span>
                    </div>
                </div>
            </div>

            <div class="mf-anim-2">
                <div class="mf-section-label">
                    <div class="dot"></div>
                    <span>Danh sách sản phẩm <small>Nhấn "Chỉnh sửa" để cập nhật từng dòng</small></span>
                </div>

                <div class="mf-table-card">
                    <div class="card-top-bar">
                        <span class="bar-title">📋 Kho sản phẩm hiện có</span>
                    </div>
                    <div class="table-responsive">
                        <asp:GridView ID="gvFruits" runat="server"
                            AutoGenerateColumns="false"
                            DataKeyNames="FruitID"
                            CssClass="table table-hover mb-0"
                            AutoGenerateEditButton="true"
                            AutoGenerateDeleteButton="true"
                            OnRowEditing="gvFruits_RowEditing"
                            OnRowDeleting="gvFruits_RowDeleting"
                            OnRowCancelingEdit="gvFruits_RowCancelingEdit"
                            OnRowUpdating="gvFruits_RowUpdating"
                            EmptyDataText=""
                            EmptyDataRowStyle-CssClass="mf-empty">
                            <Columns>

                                <asp:TemplateField HeaderText="Tên sản phẩm">
                                    <ItemTemplate>
                                        <strong style="color: var(--ink)"><%# Eval("FruitName") %></strong>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditName" runat="server"
                                            Text='<%# Bind("FruitName") %>' CssClass="form-control" />
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Giá bán">
                                    <ItemTemplate>
                                        <span style="color: var(--green-mid); font-weight: 600">
                                            <%# string.Format("{0:N0} ₫", Eval("Price")) %>
                                        </span>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditPrice" runat="server"
                                            Text='<%# Bind("Price") %>' CssClass="form-control" />
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Xuất xứ">
                                    <ItemTemplate>
                                        <span style="background: var(--green-pale); color: var(--green-deep); padding: .25rem .65rem; border-radius: 50px; font-size: .78rem; font-weight: 600">
                                            <%# Eval("Brand") %>
                                        </span>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditBrand" runat="server"
                                            Text='<%# Bind("Brand") %>' CssClass="form-control" />
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="CategoryID" HeaderText="Mã loại" />
                                <asp:TemplateField HeaderText="Tồn kho">
                                    <ItemTemplate>
                                        <span style="color: green; font-weight: bold">
                                            <%# Convert.ToInt32(Eval("StockQuantity")) > 0 ? "Còn hàng" : "Hết hàng" %>
                                        </span>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditStock" runat="server"
                                            Text='<%# Bind("StockQuantity") %>' />
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Ảnh">
                                    <ItemTemplate>
                                        <asp:Image ID="imgFruit" runat="server"
                                            Width="52" Height="52"
                                            ImageUrl='<%# Eval("ImagePath") %>'
                                            Style="object-fit: cover; border-radius: 10px; border: 2px solid #d8e8dd; box-shadow: 0 2px 8px rgba(0,0,0,.08)" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Image ID="imgOld" runat="server"
                                            Width="52"
                                            ImageUrl='<%# Eval("ImagePath") %>'
                                            Style="border-radius: 8px; border: 2px solid #d8e8dd; display: block; margin-bottom: .4rem" /><br />
                                        <asp:FileUpload ID="fuEditImage" runat="server" Style="font-size: .8rem" />
                                        <asp:HiddenField ID="hfOldImage" runat="server" Value='<%# Eval("ImagePath") %>' />
                                    </EditItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <EmptyDataTemplate>
                                <div class="mf-empty">
                                    <div class="empty-icon">🍃</div>
                                    <p>Chưa có sản phẩm nào. Hãy thêm sản phẩm đầu tiên bên dưới!</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <hr class="mf-divider" />

            <div class="mf-anim-3">
                <div class="mf-section-label">
                    <div class="dot"></div>
                    <span>Thêm sản phẩm mới</span>
                </div>

                <div class="row justify-content-center">
                    <div class="col-lg-9">
                        <div class="mf-form-card mf-anim-4">

                            <div class="form-header">
                                <h4>Thêm trái cây mới 🛒</h4>
                                <p>Điền đầy đủ thông tin để hiển thị sản phẩm lên cửa hàng</p>
                            </div>

                            <div class="form-body">

                                <div class="mf-row">
                                    <div class="mf-field">
                                        <label class="mf-label"><i class="fa fa-tag"></i>Tên sản phẩm</label>
                                        <asp:TextBox ID="txtName" runat="server"
                                            CssClass="form-control"
                                            placeholder="VD: Xoài Cát Hòa Lộc..." />
                                    </div>
                                    <div class="mf-field">
                                        <label class="mf-label"><i class="fa fa-money-bill"></i>Giá bán (VNĐ)</label>
                                        <asp:TextBox ID="txtPrice" runat="server"
                                            CssClass="form-control"
                                            placeholder="VD: 85000" />
                                    </div>
                                </div>

                                <div class="mf-row">
                                    <div class="mf-field">
                                        <label class="mf-label"><i class="fa fa-globe"></i>Xuất xứ / Thương hiệu</label>
                                        <asp:TextBox ID="txtBrand" runat="server"
                                            CssClass="form-control"
                                            placeholder="VD: Việt Nam, Thái Lan..." />
                                    </div>
                                    <div class="mf-field">
                                        <label class="mf-label"><i class="fa fa-list"></i>Danh mục</label>
                                        <asp:DropDownList ID="ddlCat" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="mf-field">
                                    <label class="mf-label"><i class="fa fa-align-left"></i>Mô tả sản phẩm</label>
                                    <asp:TextBox ID="txtDesc" runat="server"
                                        CssClass="form-control"
                                        TextMode="MultiLine" Rows="3"
                                        placeholder="Mô tả hương vị, đặc điểm nổi bật, cách bảo quản..." />
                                </div>

                                <div class="mf-field">
                                    <label class="mf-label"><i class="fa fa-image"></i>Hình ảnh sản phẩm</label>
                                    <div class="mf-upload-zone">
                                        <div class="upload-icon">📷</div>
                                        <strong style="font-size: .88rem; color: var(--green-deep)">Chọn ảnh để tải lên</strong>
                                        <span class="upload-hint">PNG, JPG, WEBP · Tối đa 5MB</span>
                                        <asp:FileUpload ID="fuImage" runat="server" />
                                    </div>
                                </div>

                                <asp:Button ID="btnAdd" runat="server"
                                    CssClass="mf-btn-submit"
                                    Text="＋  Lưu sản phẩm"
                                    OnClick="btnAdd_Click" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
