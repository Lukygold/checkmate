package com.kh.checkmate.location.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.checkmate.location.model.service.LocationService;
import com.kh.checkmate.location.model.vo.Location;


@Controller
public class LocationController {

	@Autowired
	private LocationService LocationService;
	
	@RequestMapping("location.lo")
	public String selectList(float locationLatitude, float locationLongitude, int userNo) {
		
		Location l = new Location();
		l.setLocationLatitude(locationLatitude);
		l.setLocationLongitude(locationLongitude);
		l.setUserNo(userNo);
		
		int listCount = LocationService.selectListCount(l);
		
		// 없을때 (최초 로그인)
		if(listCount == 0) {
			int result = LocationService.insertCoordinate(l);
		} else { // 있을때 업데이트
			int result = LocationService.updateCoordinate(l);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("locationMap.lo")
	public String selectMap() {

		return "location/location";
	}
	
	@RequestMapping(value="locationMapList.lo",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String selectMapList() {
		ArrayList<Location> list = LocationService.selectMapList();
		
//		JSONObject obj = new JSONObject();
//		try {
//			JSONArray jArray = new JSONArray();
//			for(int i=0; i<list.size(); i++) {
//				JSONObject sObject = new JSONObject();
//				sObject.put("lat", list.get(i).getLocationLatitude());
//				sObject.put("lng", list.get(i).getLocationLongitude());
//				jArray.put(sObject);
//			}
//		}
		System.out.println(list);
		JSONObject listData= new JSONObject();
		JSONArray listArray = new JSONArray();
		JSONObject listObject = new JSONObject();
		String data = "";
		for(int i=0; i<list.size(); i++) {
			if(i==0 && list.size()>0) {
				data = "{\n  \"positions\" : [\n    {\"lng\": "+list.get(i).getLocationLongitude()+",\n    \"lat\": "+list.get(i).getLocationLatitude()+"\n    }, \n";
			} else if(i==list.size()-1) {
				data += "\n    {\"lng\": "+list.get(i).getLocationLongitude()+",\n    \"lat\": "+list.get(i).getLocationLatitude()+"}\n  ]\n}";
			}
		}
		
		
	    File myFile = new File("D:\\KH\\100.final\\github\\checkmate\\src\\main\\webapp\\resources\\kakaoMap/kakaoMap2.json");
	    try {
	      if(myFile.createNewFile()){
	        System.out.println("파일이 생성되었습니다.");
	        BufferedWriter writer = new BufferedWriter(new FileWriter(myFile));
	        writer.write(data);
	        writer.close();
	      }else {
	        System.out.println("파일을 생성하지 못했습니다.");
	      }
	    } catch (IOException e) {
	      e.printStackTrace();
	      System.out.println("예외 처리");
	      System.out.println("파일을 생성하는 과정에서 오류가 발생했습니다.");
	    }

	    //파일의 존재여부를 판단하는 함수
	    //.exists()
	    if(myFile.exists()){
	      System.out.println("파일이 존재합니다.");
	    }else{
	      System.out.println("파일이 존재하지 않습니다.");
	    }

	    //파일을 읽고 쓸 수 있는지 체크하는 함수
	    //.canRead(), .canWrite()
	    if(myFile.canRead()){
	      System.out.println("파일을 읽을 수 있습니다.");
	    }else{
	      System.out.println("파일을 읽을 수 없습니다.");
	    }

	    if(myFile.canWrite()){
	      System.out.println("파일을 쓸 수 있습니다.");
	    }else{
	      System.out.println("파일을 쓸 수 없습니다.");
	    }

	    //파일을 삭제하는 함수
	    //.delete()
//	    if(myFile.delete()){
//	      System.out.println("파일이 삭제 되었습니다.");
//	    }else{
//	      System.out.println("파일이 삭제되지 않았습니다.");
//	    }
		System.out.println(data);
			
//		listData.put("lat", list.get(i).getLocationLatitude());
//		listData.put("lng", list.get(i).getLocationLongitude());
//		
//		listArray.add(listData);
//		listObject.put("positions", listArray);
//		
//		System.out.println(listObject);
		
		
		
		
		return new Gson().toJson(list);
		
	}
}
