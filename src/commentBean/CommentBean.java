package commentBean;

public class CommentBean {
	
	    public static final int PAGE_SIZE = 2; // 每页记录数
	    private int id;// 编号
	    private String comments;// 评论
	    
	    
	    /* setter和getter方法 */
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getComments() {
			return comments;
		}
		public void setComments(String comments) {
			this.comments = comments;
		}
		public static int getPageSize() {
			return PAGE_SIZE;
		}
	   
		
	    
	   
	    
	    
	    
}
