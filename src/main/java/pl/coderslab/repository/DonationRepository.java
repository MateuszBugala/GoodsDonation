package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Donation;

import java.util.List;

public interface DonationRepository extends JpaRepository <Donation, Long> {

    List<Donation> findAllByUserId (Long id);
}
