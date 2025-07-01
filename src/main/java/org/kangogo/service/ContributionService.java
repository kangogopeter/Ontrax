package org.kangogo.service;

import org.kangogo.model.Contribution;
import org.kangogo.repository.ContributionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ContributionService {
    @Autowired
    private ContributionRepository contributionRepository;

    public List<Contribution> getAllContributions() {
        return contributionRepository.findAll();
    }

    public Optional<Contribution> getContributionById(Long id) {
        return contributionRepository.findById(id);
    }

    public Contribution saveContribution(Contribution contribution) {
        return contributionRepository.save(contribution);
    }

    public void deleteContribution(Long id) {
        contributionRepository.deleteById(id);
    }
}