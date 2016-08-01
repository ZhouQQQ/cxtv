package com.zhou.douyu.converter;

import java.util.Date;

import org.springframework.core.convert.converter.Converter;

import com.zhou.douyu.utils.FormatTransfer;


public class String2Date implements Converter<String, Date> {

	@Override
	public Date convert(String arg0) {
		// TODO Auto-generated method stub

		return FormatTransfer.String2DateTime(arg0);
	}

}


