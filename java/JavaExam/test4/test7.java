package test4;

import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

public class test7 {

	public static void main(String[] args) {

		for(int cnt = 1; cnt <= 5; cnt++) {
			System.out.println(makeLotto());
		}
	}
	
	public static Set<Integer> makeLotto() {
		Set<Integer> lottoSet = new HashSet<>();
		for(;;) {
			int num = (int)(Math.random()*45)+1;
			lottoSet.add(num);
			if(lottoSet.size()==6) {
				break;
			}
		}
		
		Set<Integer> treeSet = new TreeSet<>(lottoSet);
		return treeSet;
	}

}
