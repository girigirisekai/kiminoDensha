package ikuzo.kimi.densha.util;



public class WordAnalysis 
{
   public int Analysis(String text){
	     
	   /*    위험도의 수치를 나타낸다. 
	    이 수치가 최근 게시물 20개에 있어서 15가 넘는다면 연착이나 사고가 있다고 가정을한다.*/
	   int degree = 0;
	    
	   String [] accident = {"사고","늦어","연착","지체","지연","고장","안움직","응급"};
	  
	   for(int i = 0 ; i< accident.length; i++){
		   if(accident[i].equals(text)){
			   degree ++; 
		   }
	   }
	  
	   return degree;
	   
   }
} 