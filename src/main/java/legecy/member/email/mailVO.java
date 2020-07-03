package legecy.member.email;

public class mailVO {
	
	private String subject;
	private String text;
	private String from;
	private String to;
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	
	@Override
	public String toString() {
		return "madilVO [subject=" + subject + ", text=" + text + ", from=" + from + ", to=" + to + "]";
	}
	
	
	
}
