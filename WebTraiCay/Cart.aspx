<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeBehind="Cart.aspx.cs" Inherits="WebTraiCay.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,wght@0,400;0,700;0,900;1,400&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
  :root {
    --cream:   #FBF7EF;
    --green-dark:  #1A4731;
    --green-mid:   #2D7A4F;
    --green-light: #4CAF73;
    --green-pale:  #E8F5EE;
    --citrus:  #F4A623;
    --citrus-light:#FFF3DC;
    --red-soft:#EF5350;
    --red-pale:#FFEBEE;
    --text-main:   #1C2B20;
    --text-muted:  #7A8F82;
    --border:  #E2EDE7;
    --shadow-card: 0 4px 24px rgba(26,71,49,0.10);
    --shadow-btn:  0 6px 20px rgba(45,122,79,0.28);
  }

  * { box-sizing: border-box; }

  body {
    background: var(--cream);
    font-family: 'DM Sans', sans-serif;
    color: var(--text-main);
  }

  .cart-hero {
    background: linear-gradient(135deg, var(--green-dark) 0%, var(--green-mid) 100%);
    border-radius: 24px;
    padding: 40px 48px;
    margin-bottom: 36px;
    position: relative;
    overflow: hidden;
  }
  .cart-hero::before {
    content: '';
    position: absolute; inset: 0;
    background: url("data:image/svg+xml,%3Csvg width='80' height='80' viewBox='0 0 80 80' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Ccircle fill='%23ffffff08' cx='40' cy='40' r='40'/%3E%3Ccircle fill='%23ffffff05' cx='40' cy='40' r='25'/%3E%3C/g%3E%3C/svg%3E") repeat;
    background-size: 80px 80px;
    pointer-events: none;
  }
  .cart-hero-fruits {
    position: absolute; right: 40px; top: 50%; transform: translateY(-50%);
    font-size: 3.5rem; opacity: 0.18; letter-spacing: 8px;
    animation: floatFruits 4s ease-in-out infinite alternate;
  }
  @keyframes floatFruits {
    from { transform: translateY(-50%) translateX(0); }
    to   { transform: translateY(-55%) translateX(6px); }
  }
  .cart-hero-eyebrow {
    display: inline-flex; align-items: center; gap: 8px;
    background: rgba(244,166,35,0.22); border: 1px solid rgba(244,166,35,0.4);
    color: var(--citrus); font-size: 0.78rem; font-weight: 700;
    letter-spacing: 0.12em; text-transform: uppercase;
    padding: 6px 16px; border-radius: 50px; margin-bottom: 14px;
  }
  .cart-hero h1 {
    font-family: 'Fraunces', serif; font-size: 2.4rem; font-weight: 900;
    color: #fff; margin: 0 0 8px; line-height: 1.1;
  }
  .cart-hero p {
    color: rgba(255,255,255,0.65); font-size: 0.95rem; margin: 0;
  }
  .cart-hero-action {
    display: inline-flex; align-items: center; gap: 8px;
    background: rgba(255,255,255,0.12); border: 1px solid rgba(255,255,255,0.25);
    color: #fff; font-size: 0.85rem; font-weight: 600;
    padding: 10px 22px; border-radius: 50px; text-decoration: none !important;
    transition: all 0.3s ease; margin-top: 20px;
    backdrop-filter: blur(8px);
  }
  .cart-hero-action:hover {
    background: rgba(255,255,255,0.22); color: #fff;
    transform: translateY(-2px);
  }

  .checkout-steps {
    display: flex; align-items: center; justify-content: center;
    gap: 0; margin-bottom: 32px;
  }
  .step { display: flex; align-items: center; gap: 10px; position: relative; }
  .step-circle {
    width: 36px; height: 36px; border-radius: 50%;
    display: flex; align-items: center; justify-content: center;
    font-weight: 700; font-size: 0.85rem; transition: all 0.3s;
  }
  .step.active .step-circle {
    background: var(--green-mid); color: #fff;
    box-shadow: 0 4px 14px rgba(45,122,79,0.35);
  }
  .step.done .step-circle {
    background: var(--green-pale); color: var(--green-mid); border: 2px solid var(--green-light);
  }
  .step.inactive .step-circle {
    background: #fff; color: var(--text-muted); border: 2px solid var(--border);
  }
  .step-label {
    font-size: 0.8rem; font-weight: 600; color: var(--text-muted);
  }
  .step.active .step-label { color: var(--green-dark); }
  .step-connector {
    width: 56px; height: 2px;
    background: linear-gradient(90deg, var(--green-pale), var(--border));
    margin: 0 4px;
  }

  .cart-card {
    background: #fff; border-radius: 20px;
    box-shadow: var(--shadow-card); overflow: hidden;
    border: 1px solid var(--border); margin-bottom: 28px;
    animation: slideUp 0.5s ease both;
  }
  @keyframes slideUp {
    from { opacity: 0; transform: translateY(24px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  .cart-table-head {
    background: linear-gradient(90deg, var(--green-dark) 0%, var(--green-mid) 100%);
    padding: 0;
  }
  .cart-table-head table { margin: 0; }
  .cart-table-head th {
    color: rgba(255,255,255,0.8) !important;
    font-size: 0.75rem; font-weight: 700; letter-spacing: 0.1em;
    text-transform: uppercase; padding: 16px 20px !important;
    border: none !important; background: transparent !important;
  }

  .cart-body-table { margin: 0 !important; }
  .cart-body-table td {
    vertical-align: middle !important;
    padding: 18px 20px !important;
    border-top: 1px solid var(--border) !important;
    font-size: 0.93rem;
  }
  .cart-body-table tr { transition: background 0.2s; }
  .cart-body-table tr:hover { background: var(--green-pale); }
  .cart-body-table tr:first-child td { border-top: none !important; }

  .product-name-cell {
    display: flex; align-items: center; gap: 14px;
  }
  .product-icon-wrap {
    width: 48px; height: 48px; border-radius: 12px;
    background: var(--green-pale); display: flex; align-items: center;
    justify-content: center; font-size: 1.5rem; flex-shrink: 0;
    border: 1px solid var(--border);
  }
  .product-name-text {
    font-weight: 600; color: var(--text-main); font-size: 0.95rem; line-height: 1.3;
  }
  .product-name-text small { color: var(--text-muted); font-size: 0.78rem; font-weight: 400; display: block; }

  .qty-wrapper {
    display: inline-flex; align-items: center; gap: 0;
    background: var(--cream); border: 1.5px solid var(--border);
    border-radius: 10px; overflow: hidden;
  }
  .qty-btn {
    width: 32px; height: 36px; border: none; background: transparent;
    color: var(--green-mid); font-size: 1rem; font-weight: 700;
    cursor: pointer; transition: background 0.2s; flex-shrink: 0;
    display: flex; align-items: center; justify-content: center;
  }
  .qty-btn:hover { background: var(--green-pale); }

  .qty-wrapper input[type="text"],
  .qty-wrapper .qty-input-field {
    width: 44px !important; height: 36px !important;
    border: none !important; background: transparent !important;
    text-align: center; font-weight: 700; font-size: 0.95rem;
    color: var(--text-main); padding: 0 !important;
    outline: none !important; box-shadow: none !important;
    border-radius: 0 !important;
  }

  .price-cell {
    font-family: 'Fraunces', serif; font-weight: 700;
    color: var(--green-dark); font-size: 1rem; white-space: nowrap;
  }
  .price-cell .currency { font-size: 0.78rem; color: var(--text-muted); font-family: 'DM Sans', sans-serif; font-weight: 500; }

  .delete-btn, .delete-btn a {
    display: inline-flex; align-items: center; justify-content: center;
    width: 36px; height: 36px; border-radius: 10px;
    background: var(--red-pale); color: var(--red-soft) !important;
    border: 1px solid #FFCDD2; font-size: 0.8rem;
    cursor: pointer; transition: all 0.25s ease;
    text-decoration: none !important;
  }
  .delete-btn:hover, .delete-btn a:hover {
    background: var(--red-soft); color: #fff !important;
    transform: scale(1.1); box-shadow: 0 4px 12px rgba(239,83,80,0.3);
  }

  .cart-total-row {
    background: linear-gradient(90deg, var(--green-pale), #f0faf4) !important;
  }
  .cart-total-row td {
    border-top: 2px solid var(--green-light) !important;
    padding: 20px !important;
  }
  .total-label {
    font-family: 'DM Sans', sans-serif; font-weight: 700;
    font-size: 0.85rem; letter-spacing: 0.08em; text-transform: uppercase;
    color: var(--text-muted); display: flex; align-items: center; gap: 8px;
  }
  .total-amount {
    font-family: 'Fraunces', serif; font-size: 1.7rem; font-weight: 900;
    color: var(--green-dark); text-align: right; white-space: nowrap;
    line-height: 1;
  }
  .total-amount .vnd-tag {
    font-family: 'DM Sans', sans-serif; font-size: 0.85rem;
    color: var(--text-muted); font-weight: 600; display: block;
    text-align: right; margin-top: 2px;
  }

  .empty-cart {
    text-align: center; padding: 72px 32px;
  }
  .empty-cart-icon {
    font-size: 5rem; margin-bottom: 20px; opacity: 0.25;
    animation: pulse 2.5s ease-in-out infinite;
  }
  @keyframes pulse { 0%,100%{transform:scale(1)} 50%{transform:scale(1.06)} }
  .empty-cart h4 {
    font-family: 'Fraunces', serif; font-weight: 700;
    color: var(--text-main); margin-bottom: 8px;
  }
  .empty-cart p { color: var(--text-muted); font-size: 0.9rem; }

  .trust-strip {
    display: flex; gap: 12px; flex-wrap: wrap;
    margin-bottom: 28px; animation: slideUp 0.6s 0.15s ease both;
  }
  .trust-badge {
    display: flex; align-items: center; gap: 8px;
    background: #fff; border: 1px solid var(--border);
    border-radius: 12px; padding: 10px 16px; flex: 1; min-width: 160px;
    box-shadow: 0 2px 8px rgba(26,71,49,0.06);
  }
  .trust-badge-icon {
    width: 36px; height: 36px; border-radius: 10px;
    display: flex; align-items: center; justify-content: center;
    font-size: 1rem; flex-shrink: 0;
  }
  .trust-badge-text strong {
    display: block; font-size: 0.82rem; font-weight: 700; color: var(--text-main);
  }
  .trust-badge-text span { font-size: 0.74rem; color: var(--text-muted); }

  .action-bar {
    display: flex; justify-content: space-between; align-items: center;
    gap: 16px; flex-wrap: wrap;
    animation: slideUp 0.6s 0.25s ease both;
  }
  .btn-update {
    display: inline-flex; align-items: center; gap: 10px;
    background: #fff; border: 2px solid var(--green-light);
    color: var(--green-mid); font-weight: 700; font-size: 0.9rem;
    padding: 13px 28px; border-radius: 14px; cursor: pointer;
    transition: all 0.3s ease; text-decoration: none;
  }
  .btn-update:hover {
    background: var(--green-pale); border-color: var(--green-mid);
    transform: translateY(-2px); color: var(--green-dark);
    box-shadow: 0 6px 18px rgba(45,122,79,0.15);
  }
  .btn-checkout {
    display: inline-flex; align-items: center; gap: 12px;
    background: linear-gradient(135deg, var(--green-mid) 0%, var(--green-dark) 100%);
    color: #fff; font-weight: 700; font-size: 1rem;
    padding: 15px 40px; border-radius: 14px; border: none; cursor: pointer;
    transition: all 0.3s ease; box-shadow: var(--shadow-btn);
    letter-spacing: 0.03em; text-transform: uppercase; text-decoration: none;
  }
  .btn-checkout:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 30px rgba(45,122,79,0.38);
    color: #fff;
  }
  .btn-checkout .arrow-icon { transition: transform 0.3s; }
  .btn-checkout:hover .arrow-icon { transform: translateX(5px); }

  /* ─── ORDER SUMMARY SIDEBAR ─── */
  .order-summary-card {
    background: #fff; border-radius: 20px;
    box-shadow: var(--shadow-card); border: 1px solid var(--border);
    overflow: hidden; animation: slideUp 0.6s 0.1s ease both;
  }
  .summary-header {
    background: linear-gradient(135deg, var(--citrus-light), #fff);
    padding: 20px 24px; border-bottom: 1px solid var(--border);
    display: flex; align-items: center; gap: 12px;
  }
  .summary-header-icon {
    width: 40px; height: 40px; border-radius: 12px;
    background: var(--citrus); color: #fff;
    display: flex; align-items: center; justify-content: center; font-size: 1rem;
  }
  .summary-header h6 {
    font-family: 'Fraunces', serif; font-weight: 700;
    font-size: 1.05rem; color: var(--text-main); margin: 0;
  }
  .summary-body { padding: 20px 24px; }
  .summary-row {
    display: flex; justify-content: space-between; align-items: center;
    padding: 10px 0; border-bottom: 1px dashed var(--border);
    font-size: 0.88rem;
  }
  .summary-row:last-child { border-bottom: none; }
  .summary-row .label { color: var(--text-muted); font-weight: 500; }
  .summary-row .value { font-weight: 700; color: var(--text-main); }
  .summary-row.green .value { color: var(--green-mid); }
  .summary-total-divider { margin: 14px -24px; border: none; border-top: 2px solid var(--border); }
  .summary-grand-total {
    display: flex; justify-content: space-between; align-items: center; margin-top: 14px;
  }
  .summary-grand-total .total-label-sm {
    font-size: 0.8rem; font-weight: 700; letter-spacing: 0.08em;
    text-transform: uppercase; color: var(--text-muted);
  }
  .summary-grand-total .total-num {
    font-family: 'Fraunces', serif; font-size: 1.5rem; font-weight: 900;
    color: var(--green-dark); line-height: 1;
  }

  /* ─── RESPONSIVE ─── */
  @media(max-width:768px) {
    .cart-hero { padding: 28px 24px; }
    .cart-hero h1 { font-size: 1.7rem; }
    .cart-hero-fruits { display: none; }
    .checkout-steps { gap: 4px; }
    .step-connector { width: 28px; }
    .action-bar { flex-direction: column; }
    .btn-checkout, .btn-update { width: 100%; justify-content: center; }
    .trust-strip { flex-direction: column; }
  }
</style>

<div class="container" style="max-width: 1100px; padding: 0 20px 60px;">

  <!-- HERO -->
  <div class="cart-hero" style="animation: slideUp 0.5s ease both;">
    <div class="cart-hero-fruits">🛒🍊🍇🍋</div>
    <div class="cart-hero-eyebrow">
      <i class="fa-solid fa-basket-shopping"></i> Giỏ hàng của bạn
    </div>
    <h1>Sắp hoàn tất rồi! 🎉</h1>
    <p>Kiểm tra lại đơn hàng trước khi thanh toán nhé.</p>
    <a href="Shop.aspx" class="cart-hero-action">
      <i class="fa-solid fa-plus"></i> Thêm sản phẩm khác
    </a>
  </div>

  <!-- CHECKOUT STEPS -->
  <div class="checkout-steps">
    <div class="step active">
      <div class="step-circle"><i class="fa-solid fa-cart-shopping"></i></div>
      <span class="step-label">Giỏ hàng</span>
    </div>
    <div class="step-connector"></div>
    <div class="step inactive">
      <div class="step-circle">2</div>
      <span class="step-label">Thanh toán</span>
    </div>
    <div class="step-connector"></div>
    <div class="step inactive">
      <div class="step-circle">3</div>
      <span class="step-label">Xác nhận</span>
    </div>
  </div>

  <div class="row">
    <!-- LEFT: Cart Table -->
    <div class="col-lg-8">

      <!-- TRUST BADGES -->
      <div class="trust-strip">
        <div class="trust-badge">
          <div class="trust-badge-icon" style="background:#E8F5EE; color:#2D7A4F;">
            <i class="fa-solid fa-shield-halved"></i>
          </div>
          <div class="trust-badge-text">
            <strong>Thanh toán an toàn</strong>
            <span>Bảo mật 100%</span>
          </div>
        </div>
        <div class="trust-badge">
          <div class="trust-badge-icon" style="background:#FFF3DC; color:#F4A623;">
            <i class="fa-solid fa-truck-fast"></i>
          </div>
          <div class="trust-badge-text">
            <strong>Giao hàng trong ngày</strong>
            <span>Đặt trước 14h</span>
          </div>
        </div>
        <div class="trust-badge">
          <div class="trust-badge-icon" style="background:#FFEBEE; color:#EF5350;">
            <i class="fa-solid fa-leaf"></i>
          </div>
          <div class="trust-badge-text">
            <strong>100% tươi sạch</strong>
            <span>Cam kết chất lượng</span>
          </div>
        </div>
      </div>

      <!-- CART TABLE CARD -->
      <div class="cart-card">
        <asp:Repeater ID="rptCart" runat="server" EnableViewState="true" OnItemDataBound="rptCart_ItemDataBound">

          <HeaderTemplate>
            <div class="cart-table-head">
              <table class="table mb-0" style="table-layout:fixed;">
                <colgroup>
                  <col style="width: 42%">
                  <col style="width: 20%; text-align:center">
                  <col style="width: 24%; text-align:right">
                  <col style="width: 14%; text-align:center">
                </colgroup>
                <thead>
                  <tr>
                    <th><i class="fa-solid fa-apple-whole mr-2" style="opacity:.6;"></i>Sản phẩm</th>
                    <th class="text-center">Số lượng</th>
                    <th class="text-right">Thành tiền</th>
                    <th class="text-center">Xóa</th>
                  </tr>
                </thead>
              </table>
            </div>
            <div class="table-responsive">
              <table class="table cart-body-table mb-0" style="table-layout:fixed;">
                <colgroup>
                  <col style="width: 42%">
                  <col style="width: 20%">
                  <col style="width: 24%">
                  <col style="width: 14%">
                </colgroup>
                <tbody>
          </HeaderTemplate>

          <ItemTemplate>
            <tr>
              <asp:HiddenField ID="hfFruitID" runat="server" Value='<%# Eval("FruitID") %>' />

              <!-- Product Name -->
              <td>
                <div class="product-name-cell">
                  <div class="product-icon-wrap">🍑</div>
                  <div class="product-name-text">
                    <%# Eval("FruitName") %>
                    <small>Trái cây tươi sạch</small>
                  </div>
                </div>
              </td>

              <!-- Qty -->
              <td class="text-center">
                <div class="qty-wrapper">
                  <button type="button" class="qty-btn qty-minus" title="Giảm">−</button>
                  <asp:TextBox ID="txtQty" runat="server"
                    Text='<%# Eval("Qty") %>'
                    CssClass="qty-input-field"
                    style="width:44px!important;height:36px!important;border:none!important;background:transparent!important;text-align:center;font-weight:700;font-size:0.95rem;color:#1C2B20;padding:0!important;outline:none!important;box-shadow:none!important;border-radius:0!important;font-family:'DM Sans',sans-serif;" />
                  <button type="button" class="qty-btn qty-plus" title="Tăng">+</button>
                </div>
              </td>

              <!-- Price -->
              <td class="text-right">
                <span class="price-cell">
                  <%# Eval("TotalPrice","{0:N0}") %>
                  <span class="currency">₫</span>
                </span>
              </td>

              <!-- Delete -->
              <td class="text-center">
                <div class="delete-btn">
                  <asp:LinkButton runat="server"
                    CommandArgument='<%# Eval("FruitID") %>'
                    OnClick="btnDelete_Click"
                    ToolTip="Xóa sản phẩm này">
                    <i class="fa-solid fa-trash-can"></i>
                  </asp:LinkButton>
                </div>
              </td>
            </tr>
          </ItemTemplate>

          <FooterTemplate>
                </tbody>
                <tfoot>
                  <tr class="cart-total-row">
                    <td colspan="2">
                      <span class="total-label">
                        <i class="fa-solid fa-calculator" style="color:var(--green-mid);"></i>
                        Tổng cộng đơn hàng
                      </span>
                    </td>
                    <td class="text-right" colspan="2">
                      <div class="total-amount">
                        <asp:Literal ID="ltrTotalCart" runat="server"></asp:Literal>
                        <span class="vnd-tag">VNĐ (đã bao gồm VAT)</span>
                      </div>
                    </td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </FooterTemplate>

        </asp:Repeater>
      </div>

      <!-- ACTION BAR -->
      <div class="action-bar">
        <asp:Button ID="btnUpdateCart" runat="server"
          CssClass="btn-update"
          Text="🔄 Cập nhật giỏ hàng"
          OnClick="btnUpdateCart_Click" />

        <asp:Button ID="btnCheckout" runat="server"
          CssClass="btn-checkout"
          Text="Thanh toán ngay →"
          PostBackUrl="Checkout.aspx" />
      </div>

    </div><!-- /col-lg-8 -->

    <div class="col-lg-4 mt-4 mt-lg-0" style="padding-left:24px;">
      <div class="order-summary-card">
        <div class="summary-header">
          <div class="summary-header-icon">
            <i class="fa-solid fa-receipt"></i>
          </div>
          <div>
            <h6>Tóm tắt đơn hàng</h6>
            <span style="font-size:0.75rem; color:var(--text-muted);">Chi tiết chi phí</span>
          </div>
        </div>
        <div class="summary-body">
          <div class="summary-row">
            <span class="label"><i class="fa-solid fa-box mr-1" style="color:var(--green-light);"></i>Tạm tính</span>
            <span class="value" id="summarySubtotal">—</span>
          </div>
          <div class="summary-row green">
            <span class="label"><i class="fa-solid fa-tag mr-1" style="color:var(--citrus);"></i>Giảm giá</span>
            <span class="value" style="color:var(--citrus);">0 ₫</span>
          </div>
          <div class="summary-row">
            <span class="label"><i class="fa-solid fa-truck mr-1" style="color:#78909C;"></i>Phí vận chuyển</span>
            <span class="value" style="color:var(--green-mid);">Miễn phí</span>
          </div>
          <hr class="summary-total-divider">
          <div class="summary-grand-total">
            <span class="total-label-sm">Tổng thanh toán</span>
            <div>
              <div class="total-num" id="summaryTotal">—</div>
              <div style="font-size:0.72rem; color:var(--text-muted); text-align:right; margin-top:2px;">₫ VNĐ</div>
            </div>
          </div>

          <asp:Button ID="btnCheckoutSide" runat="server"
            CssClass="btn-checkout"
            Text="Thanh toán ngay →"
            PostBackUrl="Checkout.aspx"
            style="width:100%; justify-content:center; margin-top:20px; font-size:0.9rem; padding:13px 20px;" />

          <div style="margin-top: 16px;">
            <div style="font-size:0.78rem; font-weight:700; color:var(--text-muted); margin-bottom:8px; text-transform:uppercase; letter-spacing:0.08em;">
              <i class="fa-solid fa-ticket mr-1" style="color:var(--citrus);"></i>Mã khuyến mãi
            </div>
            <div style="display:flex; gap:8px;">
              <input type="text" placeholder="Nhập mã giảm giá..."
                style="flex:1; padding:10px 14px; border:1.5px solid var(--border); border-radius:10px; font-size:0.83rem; font-family:'DM Sans',sans-serif; outline:none; transition:border 0.2s;"
                onfocus="this.style.borderColor='var(--green-light)'"
                onblur="this.style.borderColor='var(--border)'" />
              <button type="button"
                style="padding:10px 14px; background:var(--green-pale); border:1.5px solid var(--green-light); color:var(--green-mid); border-radius:10px; font-weight:700; font-size:0.8rem; cursor:pointer; white-space:nowrap; font-family:'DM Sans',sans-serif; transition:all 0.2s;"
                onmouseover="this.style.background='var(--green-mid)';this.style.color='#fff'"
                onmouseout="this.style.background='var(--green-pale)';this.style.color='var(--green-mid)'">
                Áp dụng
              </button>
            </div>
          </div>

          <div style="margin-top:20px; background:var(--green-pale); border-radius:12px; padding:12px 14px; display:flex; gap:10px; align-items:flex-start;">
            <i class="fa-solid fa-shield-halved" style="color:var(--green-mid); margin-top:2px;"></i>
            <span style="font-size:0.78rem; color:var(--text-muted); line-height:1.5;">
              Đảm bảo hoàn tiền 100% nếu sản phẩm không đạt chất lượng như cam kết.
            </span>
          </div>
        </div>
      </div>
    </div>

</div>

<script>
document.addEventListener('DOMContentLoaded', function () {

  document.querySelectorAll('.qty-plus, .qty-minus').forEach(function(btn) {
    btn.addEventListener('click', function() {
      var wrapper = btn.closest('.qty-wrapper');
      var input   = wrapper.querySelector('input[type="text"]');
      if (!input) return;
      var val = parseInt(input.value) || 1;
      if (btn.classList.contains('qty-plus'))  input.value = val + 1;
      if (btn.classList.contains('qty-minus')) input.value = Math.max(1, val - 1);
      updateSummary();
    });
  });

  document.querySelectorAll('.delete-btn a').forEach(function(link) {
    link.addEventListener('click', function(e) {
      if (!confirm('Bạn muốn xóa sản phẩm này khỏi giỏ?')) e.preventDefault();
    });
  });

  var rows = document.querySelectorAll('.cart-body-table tbody tr');
  rows.forEach(function(row, i) {
    row.style.opacity = '0';
    row.style.transform = 'translateX(-16px)';
    row.style.transition = 'opacity 0.4s ease, transform 0.4s ease';
    setTimeout(function() {
      row.style.opacity = '1';
      row.style.transform = 'translateX(0)';
    }, 80 + i * 80);
  });

  function updateSummary() {
    var literal = document.querySelector('#ltrTotalCart, [id$="ltrTotalCart"]');
    if (literal) {
      var txt = literal.textContent.trim();
      var el1 = document.getElementById('summarySubtotal');
      var el2 = document.getElementById('summaryTotal');
      if (el1) el1.textContent = txt + ' ₫';
      if (el2) el2.textContent = txt;
    }
  }
  updateSummary();

  var checkoutBtns = document.querySelectorAll('.btn-checkout');
  checkoutBtns.forEach(function(btn) {
    setInterval(function() {
      btn.style.boxShadow = '0 10px 30px rgba(45,122,79,0.5)';
      setTimeout(function() {
        btn.style.boxShadow = '0 6px 20px rgba(45,122,79,0.28)';
      }, 600);
    }, 3000);
  });

  document.querySelectorAll('.qty-input-field').forEach(function(inp) {
    inp.addEventListener('input', function() {
      this.value = this.value.replace(/[^0-9]/g, '');
      if (parseInt(this.value) < 1 || this.value === '') this.value = 1;
    });
  });
});
</script>

</asp:Content>