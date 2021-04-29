
public class Ex14MaxMin {
	public static void main(String[] args) {
		
		int arr[] = {50, 100, -70, 20, 25, 80, 255, 42, -100, 72};
		
		
		int max = arr[0];
		int min = arr[0];
		
		for(int i=0; i<arr.length; i++) {
			if(max < arr[i]) {
				max = arr[i];
			} else if(min > arr[i]) {
				min = arr[i];
			}
		}
		
		System.out.println("최대값 = " + max);
		System.out.println("최소값 = " + min);
	}
}
