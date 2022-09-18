package com.look.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TripDTO {
	
	/*사진 번호 */
	private int imgno;
	/*사진 경로 */
	private String course;
	/*사진 좋아요 수 */
	private int heart;
	/*사진 장소 주소 */
	private String address;
	/*사진 장소 이름 */
	private String place;
	/* 장소 지역 */
	private String local;
	/* 조회수 */
	private int count;
	
	
}
