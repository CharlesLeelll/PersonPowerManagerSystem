package com.test;

import org.junit.jupiter.api.Test;

public class addData {

	@Test
	public void createSql() {
		for (int i = 0; i < 1000; i++) {
			if (i%3==0) {
				System.out.println("INSERT  INTO   user(Uname,Uweb,Ustatus,Uad) VALUES('lo"+i+"st','www.b"+i+"edas.com',0,'小米');");
			}else{
				System.out.println("INSERT  INTO   user(Uname,Uweb,Ustatus,Uad) VALUES('lo"+i+"st','www.bdw"+i+".com',1,'华为');");
			}
			System.out.println("INSERT  INTO   user(Uname,Uweb,Ustatus,Uad) VALUES('lo"+i+"st','www.ba"+i+"du.com',0,'Nokia');");
			System.out.println("INSERT  INTO   user(Uname,Uweb,Ustatus,Uad) VALUES('lo"+i+"st','www.b"+i+"dew.com',1,'AMG');");
		}
	}
}
