
public class Ex12Circle {
	
	int radius;

	public Ex12Circle(int radius) {
		super();
		this.radius = radius;
	}

	public int getRadius() {
		return radius;
	}

	public void setRadius(int radius) {
		this.radius = radius;
	}
	
	public double getArea() {
		return radius * radius * 3.14;
	}

}