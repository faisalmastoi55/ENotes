package com.notes.project.dao;

import com.notes.project.entities.AddNotesPost;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public boolean savePost(AddNotesPost p) {
        boolean f = false;

        try {

            String query = "insert into addnotes(title, content, uid) values(?,?,?)";
            PreparedStatement psmt = this.con.prepareStatement(query);

            psmt.setString(1, p.getTitle());
            psmt.setString(2, p.getContent());
            psmt.setInt(3, p.getUid());

            psmt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public List<AddNotesPost> getPostById(int pid) {
        List<AddNotesPost> list = new ArrayList<AddNotesPost>();

        AddNotesPost p = null;

        try {

            String query = "select * from addnotes where uid=? order by pid DESC";
            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setInt(1, pid);

            ResultSet set = psmt.executeQuery();

            while (set.next()) {

                p = new AddNotesPost();

                p.setPid(set.getInt(1));
                p.setTitle(set.getString(2));
                p.setContent(set.getString(3));
                p.setDate(set.getTimestamp(4));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public AddNotesPost getDataById(int noteId) {
        AddNotesPost p = null;

        try {

            String query = "select * from addnotes where pid=?";

            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setInt(1, noteId);

            ResultSet set = psmt.executeQuery();

            if (set.next()) {

                p = new AddNotesPost();

                p.setPid(set.getInt(1));
                p.setTitle(set.getString(2));
                p.setContent(set.getString(3));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }

    public boolean updateNote(int nid, String ti, String co) {
        boolean f = false;

        try {

            String query = "update addnotes set title=?, content=? where pid=?";

            PreparedStatement psmt = con.prepareStatement(query);

            psmt.setString(1, ti);
            psmt.setString(2, co);
            psmt.setInt(3, nid);

            int i = psmt.executeUpdate();

            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean deleteNote(int nid) {
        boolean f = false;

        try {

            String query = "delete from addnotes where pid=?";

            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setInt(1, nid);
            int i = psmt.executeUpdate();

            if (i == 1) {
                f = true;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}
