package legecy.member.email;

import java.util.Map;

public interface Mailsend {
	boolean send(Map<String, Object> mailvo);
}
