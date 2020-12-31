package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;

public class PostDAO {

	private Connection conn;

	public PostDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean AddRecipe(String ti,String re,int ui) {
		boolean f=false;
		try {
			String qu="insert into post(title,recipe,uid) values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setString(1, ti);
			ps.setString(2, re);
			ps.setInt(3, ui);
			
			int status=ps.executeUpdate();
			if(status==1) {
				f=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Post> getData(int id){
		List<Post> list=new ArrayList<Post>();
		Post po=null;
		try {
			String q1="select * from post where uid=? order by id desc";
			PreparedStatement ps=conn.prepareStatement(q1);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				po=new Post();
				po.setId(rs.getInt(1));
				po.setTitle(rs.getString(2));
				po.setRecipe(rs.getString(3));
				po.setPdate(rs.getTimestamp(4));
				list.add(po);				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;	
	}
	
	public Post getDataById(int recipeid) {
		Post p=null;
		try {
			String q1="select * from post where id=?";
			PreparedStatement ps=conn.prepareStatement(q1);
			ps.setInt(1, recipeid);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				p=new Post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setRecipe(rs.getString(3));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	
	public boolean PostUpdate(int rid,String ti, String re) {
		boolean f=false;
		try {
			String q1="update post set title=?, recipe=? where id=?";
			PreparedStatement ps=conn.prepareStatement(q1);
			ps.setString(1, ti);
			ps.setString(2, re);
			ps.setInt(3, rid);
			int status=ps.executeUpdate();
			if(status==1) {
				f=true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean DeleteRecipe(int rid) {
		boolean f=false;
		try {
			String q1="delete from post where id=?";
			PreparedStatement ps=conn.prepareStatement(q1);
			ps.setInt(1, rid);
			int status=ps.executeUpdate();
			if(status==1) {
				f=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
}
