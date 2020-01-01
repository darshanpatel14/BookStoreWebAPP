package com.bookstore.entity;
// Generated 25 Dec, 2019 9:39:43 AM by Hibernate Tools 5.2.12.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "catagory", catalog = "bookstoredb")
@NamedQueries({
	
	@NamedQuery(name="Catagory.findAll", query ="SELECT c FROM Catagory c  ORDER BY c.name" ),
	@NamedQuery(name="Catagory.countAll", query ="SELECT COUNT(*) FROM Catagory" ),
	@NamedQuery(name="Catagory.findByName", query ="SELECT c FROM Catagory c WHERE c.name = :name" )
	
})
public class Catagory implements java.io.Serializable {

	private Integer catagoryId;
	private String name;
	private Set<Book> books = new HashSet<Book>(0);

	public Catagory() {
	}

	public Catagory(String name) {
		this.name = name;
	}

	public Catagory(String name, Set<Book> books) {
		this.name = name;
		this.books = books;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "catagory_id", unique = true, nullable = false)
	public Integer getCatagoryId() {
		return this.catagoryId;
	}

	public void setCatagoryId(Integer catagoryId) {
		this.catagoryId = catagoryId;
	}

	@Column(name = "name", nullable = false, length = 30)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "catagory")
	public Set<Book> getBooks() {
		return this.books;
	}

	public void setBooks(Set<Book> books) {
		this.books = books;
	}

}
