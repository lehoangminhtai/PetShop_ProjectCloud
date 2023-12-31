<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <c:import url="/WEB-INF/templates/admin/_layout/header.jsp">
    <c:param name="title" value="Quản lý danh sách loại sản phẩm"/>
  </c:import>
</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <c:import url="/WEB-INF/templates/admin/_layout/sidebar.jsp"/>
        
        <c:import url="/WEB-INF/templates/admin/pages/product-management/create-product-modal.jsp">
          <c:param name="modalId" value="modalCreateProduct" />
          <c:param name="formName" value="formCreateProduct"/>
          <c:param name="targetUrl" value="/admin/product-management/create"/>
        </c:import>
        
        <c:import url="/WEB-INF/templates/admin/pages/product-management/update-product-modal.jsp">
          <c:param name="modalId" value="modalUpdateProduct" />
          <c:param name="formName" value="formUpdateProduct"/>
          <c:param name="targetUrl" value="/admin/product-management/update"/>
        </c:import>
        
        <c:import url="/WEB-INF/templates/admin/pages/product-management/delete-product-modal.jsp">
          <c:param name="modalId" value="modalDeleteProduct" />
          <c:param name="formName" value="formDeleteProduct"/>
          <c:param name="targetUrl" value="/admin/product-management/delete"/>
        </c:import>
        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <c:import url="/WEB-INF/templates/admin/_layout/topbar.jsp"/>
                        
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Loại sản phẩm đang kinh doanh</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="mb-4">
                              <div class="row">
                                <div class="col">
                                  
                                </div>
                              </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Tên loại sản phẩm</th>
                                            <th>Ngày tạo</th>
                                            <th>Thú cưng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <c:forEach items='${requestScope["listAnimals"]}' var='animal'>
	                                      <c:forEach items='${requestScope["listCategorys"]}' var='category'>
	                                       <c:if test="${animal.getId() == category.getAnimalId()}">
			                                      <tr>
			                                         <td>${category.getCategoryName()}</td>
			                                         <td>${category.getCreatedOn()}</td>
			                                         <td>${animal.getAnimalName()}</td>
			                                      </tr>
		                                      </c:if>
	                                      </c:forEach>
                                      </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <nav aria-label="Page navigation example">
														  <ul class="pagination justify-content-center">
														    <li class="page-item">
														      <c:choose>
                                    <c:when test='${currentPage <= 1}'>
                                      <a class="page-link" aria-disabled="true">Trang trước</a>
                                    </c:when>
                                    <c:otherwise>
                                      <a class="page-link" href="/admin/product-management?page=${currentPage - 1}&limit=${numberOfRowsPerPage}">Trang trước</a>
                                    </c:otherwise>
                                  </c:choose>
														    </li>
														    <c:forEach begin="1" end="${(pageSize + numberOfRowsPerPage - 1) / numberOfRowsPerPage}" var='pageId'>
														      <c:choose>
														        <c:when test='${pageId == currentPage}'>
														          <li class="page-item active"><a class="page-link" href="/admin/product-management?page=${pageId}&limit=${numberOfRowsPerPage}">${pageId}</a></li>														          
														        </c:when>
														        <c:otherwise>
														          <li class="page-item"><a class="page-link" href="/admin/product-management?page=${pageId}&limit=${numberOfRowsPerPage}">${pageId}</a></li>
														        </c:otherwise>
														      </c:choose>
														    </c:forEach>
														    <li class="page-item">
														      <c:choose>
														        <c:when test='${currentPage >= (pageSize + numberOfRowsPerPage - 1) / numberOfRowsPerPage - 1}'>
														          <a class="page-link" aria-disabled="true">Trang sau</a>
														        </c:when>
														        <c:otherwise>
														          <a class="page-link" href="/admin/product-management?page=${currentPage + 1}&limit=${numberOfRowsPerPage}">Trang sau</a>
														        </c:otherwise>
														      </c:choose>
														    </li>
														  </ul>
														</nav>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
    </div>
    <!-- End of Page Wrapper -->
    
    <c:import url="/WEB-INF/templates/admin/_layout/js-includes.jsp"/>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>4
    
    <script>
    function onEditRowClick(id, productCode, productName, price) {
      const form = document.forms["formUpdateProduct"];
      form["id"].value = id;
      form["productCode"].value = productCode;
      form["productName"].value = productName;
      form["price"].value = price;
    }
    function onDeleteRowClick(id) {
    	const form = document.forms["formDeleteProduct"];
    	form["id"].value = id;
    }
    </script>
</body>

</html>