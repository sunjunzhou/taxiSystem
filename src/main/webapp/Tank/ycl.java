package Tank;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Vector;
import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.SourceDataLine;

class ycl {}

class Tank{
	protected int x=0;
	protected	int y=0;
	protected int fangxiang;
	protected int sudu=5;
	protected boolean shengming = true;
	public Tank(int x,int y){
		this.x = x;
		this.y = y;
	}
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	public void setFangxiang(int fangxiang){
		this.fangxiang = fangxiang;
	}
	public int getFangxiang(){
		return fangxiang;
	}
	public void setSudu(int sudu){
		this.sudu = sudu;
	}
	public int getSudu(){
		return sudu;
	}
}

class DiTank extends Tank implements Runnable{
	private int sudu=6;
	private int time=0;
 Vector<ZiDan> dzd = new Vector<ZiDan>();
 Vector<DiTank> dtk = new Vector<DiTank>();
	private ZiDan zd = null;
	DiTank(int x,int y){
		super(x,y);
	}
	public void dtkxl(Vector<DiTank> dxl){
		this.dtk=dxl;
	}
	public boolean HxPz(){
		boolean b = false;
		switch(this.fangxiang){
		case 0:
			for(int i=0;i<dtk.size();i++){
				DiTank dt = dtk.get(i);
				if(dt!=this){
					if(dt.fangxiang==0||dt.fangxiang==2){
						if(this.x>=dt.x&&this.x<=dt.x+30&&this.y>=dt.y&&this.y<=dt.y+30){
							return true;
						}
						if(this.x+20>=dt.x&&this.x+20<=dt.x+30&&this.y>=dt.y&&this.y<=dt.y+30){
							return true;
						}
					}
				}
			}
			break;
		case 1:
			for(int i=0;i<dtk.size();i++){
				DiTank dt = dtk.get(i);
				if(dt!=this){
					if(dt.fangxiang==0||dt.fangxiang==2){
						if(this.x>=dt.x&&this.x<=dt.x+30&&this.y>=dt.y&&this.y<=dt.y+30){
							return true;
						}
						if(this.x+20>=dt.x&&this.x+20<=dt.x+30&&this.y>=dt.y&&this.y<=dt.y+30){
							return true;
						}
					}
				}
			}
			break;
		case 2:
			for(int i=0;i<dtk.size();i++){
				DiTank dt = dtk.get(i);
				if(dt!=this){
					if(dt.fangxiang==0||dt.fangxiang==2){
						if(this.x>=dt.x&&this.x<=dt.x+30&&this.y>=dt.y&&this.y<=dt.y+30){
							return true;
						}
						if(this.x+20>=dt.x&&this.x+20<=dt.x+30&&this.y>=dt.y&&this.y<=dt.y+30){
							return true;
						}
					}
				}
			}
			break;
		case 3:
			for(int i=0;i<dtk.size();i++){
				DiTank dt = dtk.get(i);
				if(dt!=this){
					if(dt.fangxiang==0||dt.fangxiang==2){
						if(this.x>=dt.x&&this.x<=dt.x+30&&this.y>=dt.y&&this.y<=dt.y+30){
							return true;
						}
						if(this.x+20>=dt.x&&this.x+20<=dt.x+30&&this.y>=dt.y&&this.y<=dt.y+30){
							return true;
						}
					}
				}
			}
			break;
		}
		return b;
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		while(true){
			
			switch(this.fangxiang){
			case 0:
				for(int i=0;i<30;i++){
					if(y>25&&!HxPz()){
						y-=sudu;
					}
					try{
						Thread.sleep(50);
					}catch(Exception e){}
				}
				break;
			case 1:
				for(int i=0;i<30;i++){
					if(x>25&&!HxPz()){
						x-=sudu;
					}
					try{
						Thread.sleep(50);
					}catch(Exception e){}
				}
				break;
			case 2:
				for(int i=0;i<30;i++){
					if(y<345&&!HxPz()){
						y+=sudu;
					}
					try{
						Thread.sleep(50);
					}catch(Exception e){}
				}
				break;
			case 3:
				for(int i=0;i<30;i++){
					if(x<445&&!HxPz()){
						x+=sudu;
					}
					try{
						Thread.sleep(50);
					}catch(Exception e){}
				}
				break;
			}
			this.fangxiang = (int)(Math.random()*4);
			if(this.shengming==false){
				break;
			}
			time++;
			if(time%2==0){
				
				if(this.shengming){
					switch(this.fangxiang){
					case 0://上
						zd = new ZiDan(x+15,y-15,0);
						dzd.add(zd);
						break;
					case 1://左
						zd = new ZiDan(x-15,y+15,1);
						dzd.add(zd);
						break;
					case 2://下
						zd = new ZiDan(x+15,y+45,2);
						dzd.add(zd);
						break;
					case 3://右
						zd = new ZiDan(x+45,y+15,3);
						dzd.add(zd);
						break;	
					}
					Thread dzdXc = new Thread(zd);
					dzdXc.start();
				}
									
			}
		}
	}
}

class ZiDan implements Runnable{//要让子弹动起来，就要变成线程。
	protected int x;
	protected int y;
	protected int fangxiang;
	protected int sudu=10;
	protected boolean shengming = true;
	ZiDan(int x,int y,int fangxiang){
		this.x = x;
		this.y = y;
		this.fangxiang = fangxiang;
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		while(true){//凡是线程下面的死循环，必须得给它个睡眠！
			try{
				Thread.sleep(50);
			}catch(Exception e){}
			
			switch(fangxiang){
			case 0:
				y-=sudu;
				break;
			case 1:
				x-=sudu;
				break;
			case 2:
				y+=sudu;
				break;
			case 3:
				x+=sudu;
				break;
			}
			if(x<0||y<0||x>500||y>400){
				this.shengming = false;
				break;
			}
		}
	}
	
	
}
class MyTank extends Tank{//子弹跟着坦克走，子弹的功能大多和坦克类有关

	ZiDan zd = null;
	Vector<ZiDan> zdl =new Vector<ZiDan>();
	
	public MyTank(int x,int y){
		super(x,y);
	}
	
	public void fszd(){
		switch(this.fangxiang){
		case 0://上
			zd = new ZiDan(x+15,y-15,0);
			zdl.add(zd);
			break;
		case 1://左
			zd = new ZiDan(x-15,y+15,1);
			zdl.add(zd);
			break;
		case 2://下
			zd = new ZiDan(x+15,y+45,2);
			zdl.add(zd);
			break;
		case 3://右
			zd = new ZiDan(x+45,y+15,3);
			zdl.add(zd);
			break;	
		}
		Thread t = new Thread(zd);
		t.start();
	}
	
	public void xiangZuo(){
		x-=sudu;
	}
	public void xiangYou(){
		x+=sudu;
	}
	public void xiangShang(){
		y-=sudu;
	}
	public void xiangXia(){
		y+=sudu;
	}

}

class JiLu{
	private static int dtsl = 10;
	private static int mtsl = 2;
	private static int sdtj = 0;
	private static FileWriter fw = null;
	private static BufferedWriter bw = null;
	private static FileReader fr = null;
	private static BufferedReader br = null;
	private  Vector<DiTank> dtk = new Vector<DiTank>();
	public Vector<DiTank> getDtk() {
		return dtk;
	}
	public void setDtk(Vector<DiTank> dtk) {
		this.dtk = dtk;
	}
	private static Vector<WeiZhi> wzjh = new Vector<WeiZhi>();
	
	public static void bcjl(){
		try{
			fw = new FileWriter("E:/workspace/WYW/TanKe/Tank/JiLu.txt");
			bw = new BufferedWriter(fw);
			bw.write(sdtj+"\r\n");//缓存区默认比较大
			bw.flush();
//			fw.write(sdtj+"\r\n");
		}catch(Exception e){}
		finally{
			try{
				fw.close();
				bw.close();
			}catch(Exception e){}
		}
	}
	public void cunpan(){
		try{
			fw = new FileWriter("E:/workspace/WYW/TanKe/Tank/JiLu.txt");
			bw = new BufferedWriter(fw);
			bw.write(sdtj+"\r\n");
			for(int i=0;i<dtk.size();i++){
				DiTank dt = dtk.get(i);
				if(dt.shengming){
					String zb = dt.x+" "+dt.y+" "+dt.fangxiang+" ";
					bw.write(zb+"\r\n");
					bw.flush();
				}
			}
		}catch(Exception e){}
		finally{
			try{
				fw.close();
				bw.close();
			}catch(Exception e){}
		}
	}
	public static Vector<WeiZhi> dupan(){
		try{
			fr = new FileReader("E:/workspace/WYW/TanKe/Tank/JiLu.txt");
			br = new BufferedReader(fr);
			String s = "";
			s = br.readLine();
			sdtj = Integer.parseInt(s);
			while((s=br.readLine())!=null){
				String[] sz = s.split(" ");//用字符做间隔来确定数组元素 必须和存盘中的间隔符一致
				WeiZhi wz = new WeiZhi(Integer.parseInt(sz[0]),Integer.parseInt(sz[1]),Integer.parseInt(sz[2]));
				wzjh.add(wz);
			}
		}catch(Exception e){}
		finally{
			try{
				br.close();
				fr.close();
			}catch(Exception e){}
		}
		return wzjh;
	}
	public static void dqjl(){
		try{
			fr = new FileReader("E:/workspace/WYW/TanKe/Tank/JiLu.txt");
			br = new BufferedReader(fr);
			String s = br.readLine();
			sdtj = Integer.parseInt(s);
			
		}catch(Exception e){}
		finally{
			try{
				fr.close();
				br.close();
			}catch(Exception e){}
		}
	}
	public static int getDtsl() {
		return dtsl;
	}
	public static void setDtsl(int dtsl) {
		JiLu.dtsl = dtsl;
	}
	public static int getMtsl() {
		return mtsl;
	}
	public static void setMtsl(int mtsl) {
		JiLu.mtsl = mtsl;
	}
	
	public static int getSdtj() {
		return sdtj;
	}
	public static void setSdtj(int sdtj) {
		JiLu.sdtj = sdtj;
	}
	public static void dtJs(){
		dtsl--;
	}
	public static void sdTj(){
		sdtj++;
	}
	
}
class WeiZhi{
	private int x;
	private int y;
	private int fangxiang;
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	public int getFangxiang() {
		return fangxiang;
	}
	public void setFangxiang(int fangxiang) {
		this.fangxiang = fangxiang;
	}
	public WeiZhi(int x,int y, int fangxiang){
		this.x = x;
		this.y = y;
		this.fangxiang = fangxiang;
	}
}
/*class Music extends Thread{
	private String wjm;
	public Music (String ypwj){
		wjm = ypwj;
	}
	public void run(){
		
		File wjl = new File(wjm);
		
		AudioInputStream ypsrl = null;
		try{
			ypsrl =  AudioSystem.getAudioInputStream(wjl);
			
		}catch(Exception e){}
		
		AudioFormat format = ypsrl.getFormat();
		SourceDataLine aqsj = null;
		DataLine.Info info = new DataLine.Info(SourceDataLine.class, format);
		
		try{
			aqsj = (SourceDataLine) AudioSystem.getLine(info);
			aqsj.open(format);
		}catch(Exception e){}
		aqsj.start();
		
		int zjtj = 0;
		byte[] hczj = new byte[1024];
		try{
			while (zjtj != -1){
				zjtj = ypsrl.read(hczj,0,hczj.length);
				if(zjtj>=0){
					aqsj.write(hczj,0,zjtj);
				}
			}
		}catch(Exception e){}
		finally{
			aqsj.drain();//将剩余部分处理干净
			aqsj.close();
		}
	}
}*/