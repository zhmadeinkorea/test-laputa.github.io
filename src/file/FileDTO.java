package file;

public class FileDTO {

	String fileName;
	String fileRealName;
	int bbsID;
	
	
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	
	public FileDTO(String fileName, String fileRealName) {
		super();
		this.fileName = fileName;
		this.fileRealName = fileRealName;
	}
	
	
	
}
