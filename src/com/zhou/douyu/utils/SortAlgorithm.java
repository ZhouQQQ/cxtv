package com.zhou.douyu.utils;

import java.util.UUID;

public class SortAlgorithm {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		int[] arr={43,32,23,13,5,14};
//		insertSort(arr);
//		for (int i = 0; i < arr.length; i++) {
//			System.out.print(i!=arr.length-1?arr[i]+",":arr[i]);	
		
		System.out.println(geneUUID());
		
	}

	/**
	 * 直接插入排序 把新的数据插入到已经排好的数据列中
	 * 1.将第一个数和第二个数排序，构成一个有序数列
	 * 2.将第三个数插入进去，构成一个新的有序序列
	 * 3.对第四个数、第五个数...直到最后一个数，重复第二步
	 */
	public static void insertSort(int[] arr) {
		for (int i = 1; i < arr.length; i++) { // i从1开始，第一个数不用插入
			int insertNum = arr[i]; // insertNum表示将要插入的数
			int j=i-1; //j表示已经排好序元素的个数
			for(;j>=0&&arr[j]>insertNum;j--){
				arr[j+1]=arr[j];//将大于要插入的数右移
			}
			arr[j+1]=insertNum; 
		}
	}
	
	public static String geneUUID(){
		return UUID.randomUUID().toString().replace("-","");
	}
}
