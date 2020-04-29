package com.test.mybatis;

import java.util.List;

import kr.co.shineware.nlp.komoran.constant.DEFAULT_MODEL;
import kr.co.shineware.nlp.komoran.core.Komoran;
import kr.co.shineware.nlp.komoran.model.KomoranResult;
import kr.co.shineware.nlp.komoran.model.Token;

public class MorphemeAnalyze
{
	public String analyze(String keyword)
	{
		String result="|";
		
		if(keyword==null)
		{
			result += "|";
		}
		else
		{
			Komoran komoran = new Komoran(DEFAULT_MODEL.FULL);
			KomoranResult komoranResult = komoran.analyze(keyword);
			List<Token> tokenList = komoranResult.getTokenList();
			for (Token token : tokenList)
			{
				System.out.format("(%2d, %2d) %s/%s\n", token.getBeginIndex(), token.getEndIndex(), token.getMorph(), token.getPos());
	        	if(token.getPos().equals("NNP") || token.getPos().equals("NNG") || token.getPos().equals("NP")  || token.getPos().equals("SL"))
	        		result += token.getMorph() + "|";
			}
			
			result = result.replaceAll(" ", "|");			
		}
		
		return result;
	}
}
