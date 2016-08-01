/**
  * Copyright 2016 aTool.org 
  */
package com.zhou.douyu.pojo;
import java.util.List;
import org.codehaus.jackson.annotate.JsonProperty;
/**
 * Auto-generated: 2016-07-19 17:13:12
 *
 * @author aTool.org (i@aTool.org)
 * @website http://www.atool.org/json2javabean.php
 */
public class Data {

    @JsonProperty("room_id")
    private String roomId;
    @JsonProperty("room_thumb")
    private String roomThumb;
    @JsonProperty("cate_id")
    private String cateId;
    @JsonProperty("cate_name")
    private String cateName;
    @JsonProperty("room_name")
    private String roomName;
    @JsonProperty("room_status")
    private String roomStatus;
    @JsonProperty("owner_name")
    private String ownerName;
    private String avatar;
    private int online;
    @JsonProperty("owner_weight")
    private String ownerWeight;
    @JsonProperty("fans_num")
    private String fansNum;
    @JsonProperty("start_time")
    private String startTime;
    private List<Gift> gift;
    public void setRoomId(String roomId) {
         this.roomId = roomId;
     }
     public String getRoomId() {
         return roomId;
     }

    public void setRoomThumb(String roomThumb) {
         this.roomThumb = roomThumb;
     }
     public String getRoomThumb() {
         return roomThumb;
     }

    public void setCateId(String cateId) {
         this.cateId = cateId;
     }
     public String getCateId() {
         return cateId;
     }

    public void setCateName(String cateName) {
         this.cateName = cateName;
     }
     public String getCateName() {
         return cateName;
     }

    public void setRoomName(String roomName) {
         this.roomName = roomName;
     }
     public String getRoomName() {
         return roomName;
     }

    public void setRoomStatus(String roomStatus) {
         this.roomStatus = roomStatus;
     }
     public String getRoomStatus() {
         return roomStatus;
     }

    public void setOwnerName(String ownerName) {
         this.ownerName = ownerName;
     }
     public String getOwnerName() {
         return ownerName;
     }

    public void setAvatar(String avatar) {
         this.avatar = avatar;
     }
     public String getAvatar() {
         return avatar;
     }

    public void setOnline(int online) {
         this.online = online;
     }
     public int getOnline() {
         return online;
     }

    public void setOwnerWeight(String ownerWeight) {
         this.ownerWeight = ownerWeight;
     }
     public String getOwnerWeight() {
         return ownerWeight;
     }

    public void setFansNum(String fansNum) {
         this.fansNum = fansNum;
     }
     public String getFansNum() {
         return fansNum;
     }

    public void setStartTime(String startTime) {
         this.startTime = startTime;
     }
     public String getStartTime() {
         return startTime;
     }

    public void setGift(List<Gift> gift) {
         this.gift = gift;
     }
     public List<Gift> getGift() {
         return gift;
     }

}