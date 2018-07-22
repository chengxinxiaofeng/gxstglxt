/**
 * 
 */
package com.zyf.ssm.tools;

import java.util.Scanner;


/**
 * @ClassName Main
 * @Description TODO
 * @Date 2018年4月20日
 */
public class Main {
    public static void main(String[] args){
    	int count;
    	int []num = new int[100];
    	Scanner scan = new Scanner(System.in);  
    	count = scan.nextInt();
    	for(int i = 0;i<count;i++){ 		
    		num[i] =  scan.nextInt();
    	}
    	for(int i = 0;i<count;i++){
    /*		System.out.println("---------------");*/
    		int length =  (num[i]+"").length();
    		int sum=0;
    		int temp=0 ;
    		if(length==1){
    			System.out.println(num[i]);
    		}else{
    		for(int j = 1;j<=length-1;j++){
    			if(j==1){
    				temp = 9;
    			}else{
    				temp = (int) (9+Math.pow(10, j-1));
    			}
    			sum+=j*temp;
    		}
    		sum=(int) (sum+(num[i]-Math.pow(10, length-1)+1)*(length));
    		System.out.println(sum);
    		}
    		
    	}
    	
    	
    	
    }

}
