package pl.coderslab.model;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "donations")
public class Donation {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    private User user;

    @ManyToMany(cascade = CascadeType.MERGE)
    private List<DonatedItem> donatedItems = new ArrayList<>();

    private int qty;

    @ManyToOne
    private Institution institution;

    private String pickUpstreet;
    private String pickUpcity;
    private String pickUpzip;
    private String pickUpphoneNumber;

    private LocalDate pickUpDate;
    private LocalTime pickUpTime;
    private String pickUpRemarks;

    private boolean realized;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<DonatedItem> getDonatedItems() {
        return donatedItems;
    }

    public void setDonatedItems(List<DonatedItem> donatedItems) {
        this.donatedItems = donatedItems;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public Institution getInstitution() {
        return institution;
    }

    public void setInstitution(Institution institution) {
        this.institution = institution;
    }

    public String getPickUpstreet() {
        return pickUpstreet;
    }

    public void setPickUpstreet(String pickUpstreet) {
        this.pickUpstreet = pickUpstreet;
    }

    public String getPickUpcity() {
        return pickUpcity;
    }

    public void setPickUpcity(String pickUpcity) {
        this.pickUpcity = pickUpcity;
    }

    public String getPickUpzip() {
        return pickUpzip;
    }

    public void setPickUpzip(String pickUpzip) {
        this.pickUpzip = pickUpzip;
    }

    public String getPickUpphoneNumber() {
        return pickUpphoneNumber;
    }

    public void setPickUpphoneNumber(String pickUpphoneNumber) {
        this.pickUpphoneNumber = pickUpphoneNumber;
    }

    public LocalDate getPickUpDate() {
        return pickUpDate;
    }

    public void setPickUpDate(LocalDate pickUpDate) {
        this.pickUpDate = pickUpDate;
    }

    public LocalTime getPickUpTime() {
        return pickUpTime;
    }

    public void setPickUpTime(LocalTime pickUpTime) {
        this.pickUpTime = pickUpTime;
    }

    public String getPickUpRemarks() {
        return pickUpRemarks;
    }

    public void setPickUpRemarks(String pickUpRemarks) {
        this.pickUpRemarks = pickUpRemarks;
    }

    public boolean isRealized() {
        return realized;
    }

    public void setRealized(boolean realized) {
        this.realized = realized;
    }

    @Override
    public String toString() {
        return "Donation{" +
                "id=" + id +
                ", user=" + user +
                ", donatedItems=" + donatedItems +
                ", qty=" + qty +
                ", institution=" + institution +
                ", pickUpstreet='" + pickUpstreet + '\'' +
                ", pickUpcity='" + pickUpcity + '\'' +
                ", pickUpzip='" + pickUpzip + '\'' +
                ", pickUpphoneNumber='" + pickUpphoneNumber + '\'' +
                ", pickUpDate=" + pickUpDate +
                ", pickUpTime=" + pickUpTime +
                ", pickUpRemarks='" + pickUpRemarks + '\'' +
                ", realized=" + realized +
                '}';
    }
}
