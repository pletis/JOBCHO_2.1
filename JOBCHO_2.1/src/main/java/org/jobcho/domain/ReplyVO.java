package org.jobcho.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO  implements Serializable{
	private int reply_num; // ��۹�ȣ
	private String reply_contents; //��۳���
	private int member_num; //�����ȣ
	private int post_num; //�Խñ۹�ȣ
	private int isLive; //??
	private Date reply_date; //��� �ۼ��ð�
	
	private MembersVO member; //��� �ۼ���
	private PostVO post; //�Խñ�
}
