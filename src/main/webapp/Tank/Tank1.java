package Tank;

import java.awt.*;

import javax.swing.*;

import java.awt.event.*;
import java.util.Vector;


public class Tank1 extends JFrame implements ActionListener{
	private JMenuBar cdl = null;
	private JMenu cd1 = null;
	private JMenuItem[] cdx = {null,null,null,null};
	
	private wdmb mb = null;
	private TaskJPanel task = null;
	public static void main(String[] args){
		Tank1 lx = new Tank1();
	}
	
	public Tank1(){
		
		cdl =  new JMenuBar();
		cd1 = new JMenu("游戏(G)");
		cd1.setMnemonic('G');
		cdx[0] = new JMenuItem("新游戏(N)");
		cdx[0].setMnemonic('N');
		cdx[0].setActionCommand("new Game");
		cdx[0].addActionListener(this);
		cdx[1] = new JMenuItem("退出游戏(E)");
		cdx[1].setMnemonic('E');
		cdx[1].addActionListener(this);
		cdx[1].setActionCommand("Exit");
		cdx[2] = new JMenuItem("存盘退出(C)");
		cdx[2].setMnemonic('C');
		cdx[2].addActionListener(this);
		cdx[2].setActionCommand("save Exit");
		cdx[3] = new JMenuItem("继续游戏(S)");
		cdx[3].setMnemonic('S');
		cdx[3].addActionListener(this);
		cdx[3].setActionCommand("Go on Game");
		cd1.add(cdx[0]);
		cd1.add(cdx[1]);
		cd1.add(cdx[2]);
		cd1.add(cdx[3]);
		cdl.add(cd1);
//		mb = new wdmb();
//		
//		this.add(mb);
//		this.addKeyListener(mb);
//		Thread t = new Thread(mb);
//		t.start();
		
		task = new TaskJPanel();
		Thread taskXc = new Thread(task);
		taskXc.start();
		this.add(task);
		this.setJMenuBar(cdl);
		
		this.setTitle("坦克大战");
		ImageIcon picture = new ImageIcon("image/Tank.jpg");
		this.setIconImage(picture.getImage());
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setBounds(300,80, 900, 600);
		this.setVisible(true);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if(e.getActionCommand().equals("new Game")){
			mb = new wdmb("new Game");
			this.remove(task);
			this.add(mb);
			this.addKeyListener(mb);
			Thread t = new Thread(mb);
			t.start();
			this.setVisible(true);
		}else if(e.getActionCommand().equals("save Exit")){
			JiLu jl = new JiLu();
			jl.setDtk(mb.dtk);
			jl.cunpan();
			System.exit(0);
		}else if(e.getActionCommand().equals("Go on Game")){
			mb = new wdmb("Go on Game");
			this.remove(task);
			this.add(mb);
			this.addKeyListener(mb);
			Thread t = new Thread(mb);
			t.start();
			this.setVisible(true);
		}else if(e.getActionCommand().equals("Exit")){
			JiLu.bcjl();
			System.exit(0);
		}
	}

}

class TaskJPanel extends JPanel implements Runnable{
	private int time = 0;
	TaskJPanel(){}
	public void paint(Graphics g){
		super.paint(g);
		g.fillRect(0, 0, 500, 400);
		if(time%2==0){
			g.setColor(Color.yellow);
			g.setFont(new Font("华文行楷",Font.BOLD,35));
			g.drawString("第1关", 200, 200);
		}
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		while(true){
			try{
				Thread.sleep(600);
			}catch(Exception e){}
			this.repaint();
			time++;
		}
	}
}
class wdmb extends JPanel implements KeyListener,Runnable{
	private MyTank mt = null;
	Vector<DiTank> dtk = new Vector<DiTank>();
	private int tksl = 4;
	private ZiDan zd = null;
	Vector<WeiZhi> wzjh = new Vector<WeiZhi>();
	wdmb(String ss){
		JiLu.dqjl();
		mt = new MyTank(182,370);
		if(ss.equals("new Game")){
			for(int i=0;i<tksl;i++){
				DiTank dt = new DiTank((i*155)+5,0);
				dt.setFangxiang(2);
				Thread action = new Thread(dt);
				action.start();
				zd = new ZiDan(dt.getX()+15,dt.getY()+45,2);
				dt.dzd.add(zd);
				Thread t = new Thread(zd);
				t.start();
				dtk.add(dt);
			}
		}else if(ss.equals("Go on Game")){
			wzjh = JiLu.dupan();
			for(int i=0;i<wzjh.size();i++){
				WeiZhi wz = wzjh.get(i);
				DiTank dt = new DiTank(wz.getX(),wz.getY());
				dt.setFangxiang(wz.getFangxiang());
				dt.dtkxl(dtk);
				Thread action = new Thread(dt);
				action.start();
				zd = new ZiDan(dt.getX()+15,dt.getY()+45,2);
				dt.dzd.add(zd);
				Thread t = new Thread(zd);
				t.start();
				dtk.add(dt);
			}
		}
//		Music music = new Music("./Tank.wav");
//		music.start();
	}
	public void tjDtNum(Graphics g){
		this.drawTank(80,450,g,0,0);
		g.setColor(Color.black);
		g.drawString(JiLu.getMtsl()+"", 120, 465);
		this.drawTank(160,450, g, 0, 1);
		g.setColor(Color.black);
		g.drawString(JiLu.getDtsl()+"", 200, 465);
		this.drawTank(600, 90, g, 0, 1);
		g.setColor(Color.BLUE);
		Font font = new Font("华文行楷",Font.BOLD,35);
		g.setFont(font);
		g.drawString("您消灭的坦克总数", 520, 50);
		g.drawString(JiLu.getSdtj()+"", 650, 110);
		g.setColor(Color.black);
		g.setFont(new Font("",Font.BOLD,15));
		g.drawString("本    偶    醉    坐     大    海    论    怒", 520, 180);
		g.drawString("是    做    舞    井     志    斗    到    指       丁",520, 210);
		g.drawString("后    前    经    说     戏    量    囊    乾       元", 520, 240);
		g.drawString("山    堂    阁    天     功    福    中    坤       英", 520, 270);
		g.drawString("人    客    半    阔     名    祸    羞    错", 520, 300);
		g.drawString("，    。    卷    。     ，    。    涩    。", 520, 330);
		g.drawString("                书                             时", 520, 360);
		g.drawString("                ，                             ，", 520, 390);
	}
 	public void paint(Graphics g){
		super.paint(g);
		g.fillRect(0, 0, 500, 400);
		this.tjDtNum(g);
		if(mt.shengming){
			this.drawTank(mt.getX(), mt.getY(), g, mt.fangxiang, 0);
		}
		for(int i=0;i<dtk.size();i++){	
			DiTank dt = dtk.get(i);	
			if(dt.shengming){	
				drawTank(dt.getX(), dt.getY(), g, dt.fangxiang, 1);
				for(int j=0;j<dt.dzd.size();j++){
					ZiDan zd = dt.dzd.get(j);
					if(zd.shengming){
						g.setColor(Color.white);
						g.fill3DRect(zd.x, zd.y, 3, 3, false);
					}
				}
			}
			
		}

		
		for(int i=0;i<mt.zdl.size();i++){
			
			ZiDan zd = mt.zdl.get(i);
			
			if(zd!=null&&zd.shengming==true){
				g.setColor(Color.white);
				g.fill3DRect(zd.x, zd.y, 3, 3, false);
			}else{
				this.mt.zdl.remove(i);
			}
		}
	}
	public void jzwf(){
		for(int i=0;i<this.dtk.size();i++){
			DiTank dt = dtk.get(i);
			for(int j=0;j<dt.dzd.size();j++){
				ZiDan zd = dt.dzd.get(j);
				this.jzsf(zd, mt);
			}
		}
	}
	public void jzdf1(){
		for(int i=0;i<mt.zdl.size();i++){
			//这里用二层循环的目的是，让每发子弹和每个敌人坦克比较。
			ZiDan zd = mt.zdl.get(i);
			if(zd.shengming){
				for(int j=0;j<dtk.size();j++){
					DiTank dt = dtk.get(j);
					if(dt.shengming){
						if(this.jzsf( zd, dt)){
							JiLu.dtJs();
							JiLu.sdTj();
						}
					}
				}
			}
		}
	}
	public boolean jzsf(ZiDan zd,Tank dt){
		boolean b2 = false;
		switch(dt.fangxiang){
		case 0:
		case 2:
			if(zd.x>dt.x && zd.x<dt.x+30 && zd.y>dt.y && zd.y<dt.y+30){
				zd.shengming = false;
				dt.shengming = false;
				b2 = true;
			}
			break;
		case 1:
		case 3:
			if(zd.x>dt.x && zd.x<dt.x+30 && zd.y>dt.y && zd.y<dt.y+30){
				zd.shengming = false;
				dt.shengming = false;
				b2 = true;
			}
			break;
		}
		return b2;
	}
	
	
	public void drawTank(int x,int y,Graphics g,int fangxiang,int leixing){
		switch(leixing){
		case 0 :
			g.setColor(Color.yellow);
			break;
		case 1 :
			g.setColor(Color.green);
			break;
		}
		switch(fangxiang){
		case 0://上
			g.fill3DRect(x, y, 5, 30, false);
			g.fill3DRect(x+25, y, 5, 30,false);
			g.fill3DRect(x+5, y+5, 20, 20, false);
			g.fillOval(x+5, y+5, 20, 20);
			g.drawLine(x+15, y+15, x+15, y-15);
			break;
		case 1://左
			g.fill3DRect(x, y, 30, 5, false);
			g.fill3DRect(x, y+25, 30, 5,false);
			g.fill3DRect(x+5, y+5, 20, 20, false);
			g.fillOval(x+5, y+5, 20, 20);
			g.drawLine(x+15, y+15, x-15, y+15);
			break;
		case 2://下
			g.fill3DRect(x, y, 5, 30, false);
			g.fill3DRect(x+25, y, 5, 30,false);
			g.fill3DRect(x+5, y+5, 20, 20, false);
			g.fillOval(x+5, y+5, 20, 20);
			g.drawLine(x+15, y+15, x+15, y+45);
			break;
		case 3://右
			g.fill3DRect(x, y, 30, 5, false);
			g.fill3DRect(x, y+25, 30, 5,false);
			g.fill3DRect(x+5, y+5, 20, 20, false);
			g.fillOval(x+5, y+5, 20, 20);
			g.drawLine(x+15, y+15, x+45, y+15);
			break;		
		}
	}

	@Override
	public void keyTyped(KeyEvent e) {}
	@Override
	public void keyReleased(KeyEvent e) {}
	@Override
	public void keyPressed(KeyEvent e) {
	//	System.out.println((char)e.getKeyCode());
		if(e.getKeyCode()==KeyEvent.VK_W){
			this.mt.setFangxiang(0);
			this.mt.xiangShang();
		}else if(e.getKeyCode()==KeyEvent.VK_A){
			this.mt.setFangxiang(1);
			this.mt.xiangZuo();
		}else if(e.getKeyCode()==KeyEvent.VK_S){
			this.mt.setFangxiang(2);
			this.mt.xiangXia();
		}else if(e.getKeyCode()==KeyEvent.VK_D){
			this.mt.setFangxiang(3);
			this.mt.xiangYou();
		}
		if(e.getKeyCode()==KeyEvent.VK_J){
			if(mt.zdl.size()<8){
				mt.fszd();
			}
				
		}
		this.repaint();
	}
	public void run(){
		while(true){
			try{
				Thread.sleep(100);
			}catch(Exception e){}
			this.jzdf1();
			this.jzwf();
			this.repaint();
		}
	}	
}