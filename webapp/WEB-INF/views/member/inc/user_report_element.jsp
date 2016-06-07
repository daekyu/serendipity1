<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 신고페이지 -->
<section id="main" class="page ">
  <header class="page-header">
    <div class="container">
      <h1 class="title">신고페이지</h1>
    </div>	
  </header>
  <div class="container">
    <div class="row">
      <article class="col-sm-12 col-md-12 content">
		<div class="my-account">
		  <div class="bottom-padding">
			<div class="container">
			  <form>
			  	<table class="table">
			  		<tr>
			  			<th>신고대상</th>
			  			<td>leesr1203(신고당하는사람ID)</td>
			  			<th>신고사유</th>
			  			<td>
			  				<select>
			  					<option>인사안함</option>
			  					<option>대답안함</option>
			  					<option>말안들음</option>
			  				</select>
			  			</td>
			  		</tr>
			  		
			  		<tr>
			  			<th>상세이유 및 근거</th>
			  			<td colspan="3"><textarea class="form-control" style="resize:none; height:100px;" wrap="soft"></textarea></td>
			  		</tr>
			  		
			  		<tr>
			  			<td colspan="4" align="center">
			  				<input type="submit" value="제출">  <input type="reset" value="취소">
			  			</td>
			  		</tr>
			  	</table>
			  </form>
			</div>
		  </div>
		  
		</div>
      </article><!-- .content -->
    </div>
  </div>
</section><!-- #main -->